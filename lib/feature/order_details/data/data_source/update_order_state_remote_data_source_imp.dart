import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api/api_client.dart';
import 'package:tracking_app/feature/order_details/data/data_source/update_order_state_remote_data_source.dart';

@Injectable(as: UpdateOrderStateRemoteDataSource)
class UpdateOrderStateRemoteDataSourceImp
    extends UpdateOrderStateRemoteDataSource {
  final ApiClient _apiClient;

  UpdateOrderStateRemoteDataSourceImp(this._apiClient);
  @override
  Future<void> updateOrderState(String orderId, Map<String, dynamic> data) {
    return _apiClient.updateOrderState(orderId, data);
  }
}
