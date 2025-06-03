import '../../data/models/location_info.dart';
import '../../data/models/route_modifiers.dart';
import '../entity/route_entity.dart';

abstract class RouteRepository {
  Future<RouteEntity> loadRoute({
    required LocationInfo origin,
    required LocationInfo destination,
    RouteModifiers? modifiers,
  });
}