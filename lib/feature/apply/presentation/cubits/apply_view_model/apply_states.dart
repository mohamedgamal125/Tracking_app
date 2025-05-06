import 'package:tracking_app/feature/apply/domain/entites/apply_response_entity.dart';
import 'package:tracking_app/feature/apply/domain/entites/get_vehicles_entity.dart';

sealed class ApplyState {}

class ApplyInitialState extends ApplyState {}

class ApplyLoadingState extends ApplyState {}

class ApplySuccessState extends ApplyState {
  final ApplyResponseEntity? data;
  ApplySuccessState(this.data);
}

class ApplyErrorState extends ApplyState {
  final String error;
  ApplyErrorState(this.error);
}

class GetVehiclesLoadingState extends ApplyState {}

class GetVehiclesSuccessState extends ApplyState {
  final List<VehicleEntity>? data;
  GetVehiclesSuccessState(this.data);
}

class GetVehiclesErrorState extends ApplyState {
  final String error;
  GetVehiclesErrorState(this.error);
}


