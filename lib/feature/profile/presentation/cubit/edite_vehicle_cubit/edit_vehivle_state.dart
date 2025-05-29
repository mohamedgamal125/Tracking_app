import '../../../domain/entity/profile_response_entity.dart';

sealed class EditVehicleState {}

class EditVehicleInitialState extends EditVehicleState {}

class EditVehicleLoadingState extends EditVehicleState {}

class EditVehicleSuccessState extends EditVehicleState {
  final ProfileResponseEntity data;
  EditVehicleSuccessState({required this.data});
}

class EditVehicleErrorState extends EditVehicleState {
  final String message;
  EditVehicleErrorState(this.message);
}
