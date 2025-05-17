import 'package:bloc/bloc.dart';
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

  Future<void> loadRoute({
    bool isPickup = true,
    LatLngModel? userLatLng,
  }) async {
    emit(RouteLoading());

    try {
      print('📍 isPickup: $isPickup');
      print('📍 userLatLng: ${userLatLng?.latitude}, ${userLatLng?.longitude}');

      if (!isPickup && userLatLng == null) {
        emit(RouteError('❌ userLatLng is required when isPickup is false'));
        return;
      }

      // DRIVER LOCATION
      final driverLoc = await _locationService.getUserLocation();

      // STORE LOCATION
      const double storeLat = 31.201875670799417;
      const double storeLng = 29.91034419386273;

      // ICONS
      final driverIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(60, 60)),
        'assets/images/driver_location.png',
      );
      final storeIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)),
        'assets/images/Flowery_location.png',
      );
      final userIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)),
        'assets/images/user_location.png',
      );

      // FIRST LOCATION OF DRIVER
      final originInfo = LocationInfo(
        latLng: LatLngModel(
          latitude: driverLoc.latitude!,
          longitude: driverLoc.longitude!,
        ),
      );
      final originIcon = driverIcon;

      // LAST LOCATION
      final destLatLng = isPickup
          ? LatLngModel(latitude: storeLat, longitude: storeLng)
          : userLatLng!;

      final destIcon = isPickup ? storeIcon : userIcon;

      final destInfo = LocationInfo(latLng: destLatLng);

      //
      final entity = await _loadRoute(
        origin: originInfo,
        destination: destInfo,
        modifiers: RouteModifiers(
          avoidTolls: false,
          avoidFerries: false,
          avoidHighways: false,
        ),
      );

      // MARKS
      final markers = <Marker>{
        Marker(
          markerId: const MarkerId('origin'),
          position: LatLng(originInfo.latLng.latitude, originInfo.latLng.longitude),
          icon: originIcon,
        ),
        Marker(
          markerId: const MarkerId('destination'),
          position: LatLng(destLatLng.latitude, destLatLng.longitude),
          icon: destIcon,
        ),
      };

      // POLYLINE
      final polyline = Polyline(
        polylineId: const PolylineId('route'),
        points: entity.polyLines.first.points,
        color: AppColors.primaryColor,
        width: 2,
      );

      emit(RouteLoaded(
        markers: markers,
        polyLines: {polyline},
        bounds: entity.bounds,
      ));
    } catch (e) {
      emit(RouteError('❌ Error loading route: $e'));
    }
  }

}
