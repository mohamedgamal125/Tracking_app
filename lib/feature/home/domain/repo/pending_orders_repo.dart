import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/home/domain/entites/pending_orders_response_entity.dart';

abstract class PendingOrdersRepo {
  Future<Result<PendingOrdersResponseEntity>> getPendingOrders();
}
