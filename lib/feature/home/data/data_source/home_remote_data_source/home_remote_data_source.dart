import 'package:tracking_app/feature/home/data/model/pending_orders_response_dto.dart';

abstract class HomeRemoteDataSource {
  Future<PendingOrdersResponseDTO> getPendingOrders();
}