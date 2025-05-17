import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/routes_cubit/routes_state.dart';

import '../../../../../core/services/location_service.dart';
import '../../../data/models/location_info.dart';
import '../../../data/models/route_modifiers.dart';
import '../../../domain/use_case/get_routes_use_case.dart';

@injectable
class RouteCubit extends Cubit<RouteState> {
  final LoadRouteUseCase _loadRoute;
  final LocationService _locationService;

  RouteCubit(this._loadRoute, this._locationService) : super(RouteInitial());

  Future<void> loadRoute() async {
    emit(RouteLoading());
    try {
      // get driver location
      final driverLoc = await _locationService.getUserLocation();

      // store location
      const double storeLat = 31.201875670799417;
      const double storeLng = 29.91034419386273;

      // icons
      final driverIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(60, 60)),
        'assets/images/driver_location.png',
      );
      final storeIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)),
        'assets/images/Flowery_location.png',
      );

      // create LocationInfo
      final originInfo = LocationInfo(
        latLng: LatLngModel(
          latitude: driverLoc.latitude!,
          longitude: driverLoc.longitude!,
        ),
      );
      final destInfo = LocationInfo(
        latLng: LatLngModel(
          latitude: storeLat,
          longitude: storeLng,
        ),
      );

      // do use case to get data
      final entity = await _loadRoute(
        origin: originInfo,
        destination: destInfo,
        modifiers: RouteModifiers(
          avoidTolls: false,
          avoidFerries: false,
          avoidHighways: false,
        ),
      );

      // create markers with my custom icon
      final markers = <Marker>{
        Marker(
          markerId: const MarkerId('driver'),
          position: LatLng(driverLoc.latitude!, driverLoc.longitude!),
          icon: driverIcon,
        ),
        Marker(
          markerId: const MarkerId('store'),
          position: LatLng(storeLat, storeLng),
          icon: storeIcon,
        ),
      };

      // create polyLine with primary color
      final polyline = Polyline(
        polylineId: const PolylineId('route'),
        points: entity.polyLines.first.points,
        color: AppColors.primaryColor,
        width: 2,
      );

      emit(RouteLoaded(
        markers: markers,
        polyLines: { polyline },
        bounds: entity.bounds,
      ));
    } catch (e) {
      emit(RouteError('wrong when loaded Polyline $e'));
    }
  }
}
