abstract class UpdateOrderStateRemoteDataSource {
  Future<void> updateOrderState(String orderId, Map<String, dynamic> data);
}
