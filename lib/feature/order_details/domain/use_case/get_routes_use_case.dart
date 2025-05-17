import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/order_details/domain/entity/route_entity.dart';

import '../../data/models/location_info.dart';
import '../../data/models/route_modifiers.dart';
import '../repository/routes_repository.dart';
@injectable
class LoadRouteUseCase {
  final RouteRepository repository;
  LoadRouteUseCase(this.repository);

  Future<RouteEntity> call({
    required LocationInfo origin,
    required LocationInfo destination,
    RouteModifiers? modifiers,
  }) {
    return repository.loadRoute(
      origin: origin,
      destination: destination,
      modifiers: modifiers,
    );
  }
}
