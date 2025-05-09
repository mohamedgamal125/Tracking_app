import 'package:tracking_app/core/common/result.dart';

abstract class UpdateOrderStateRepo {
  Future<Result<void>> updateOrderState(String orderId, Map<String, dynamic> data);
}
