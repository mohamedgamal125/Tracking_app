import 'package:tracking_app/feature/home/domain/entites/pending_orders_response_entity.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}

class PendingOrdersLoadingState extends HomeState {}

class PendingOrdersSuccessState extends HomeState {
  final List<OrderEntity>? pendingOrders;
  PendingOrdersSuccessState(this.pendingOrders);
}

class PendingOrdersErrorState extends HomeState {
  final String error;
  PendingOrdersErrorState(this.error);
}
