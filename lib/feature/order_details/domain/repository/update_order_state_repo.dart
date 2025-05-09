abstract class UpdateOrderStateRepo {
  Future<void> updateOrderState(String orderId, Map<String, dynamic> data);
}
