import 'package:tracking_app/core/api/api_client.dart';
import 'package:tracking_app/feature/home/data/data_source/home_remote_data_source/home_remote_data_source.dart';
import 'package:tracking_app/feature/home/data/model/pending_orders_response_dto.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient _apiClient;
  HomeRemoteDataSourceImpl(this._apiClient);
  @override
  Future<PendingOrdersResponseDTO> getPendingOrders() async {
    final response = await _apiClient.getPendingOrders();
    return response.data;
  }
}
