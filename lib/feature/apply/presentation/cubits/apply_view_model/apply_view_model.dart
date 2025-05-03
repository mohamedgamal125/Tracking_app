import 'package:bloc/bloc.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/apply/data/model/apply_request_model.dart';
import 'package:tracking_app/feature/apply/domain/use_case/apply_use_case.dart';
import 'package:tracking_app/feature/apply/domain/use_case/get_vehicles_use_case.dart';
import 'package:tracking_app/feature/apply/presentation/cubits/apply_view_model/apply_states.dart';

class ApplyViewModel extends Cubit<ApplyState> {
  final ApplyUseCase _applyUseCase;
  final GetVehiclesUseCase _getVehiclesUseCase;
  ApplyViewModel(this._applyUseCase, this._getVehiclesUseCase)
      : super(ApplyInitialState());

  void apply(ApplyRequestModel request) async {
    emit(ApplyLoadingState());
    final result = await _applyUseCase.execute(request);
    switch (result) {
      case Success():
        emit(ApplySuccessState(result.data));
      case Error():
        emit(ApplyErrorState(result.exception!));
    }
  }

  void getAllVehicles() async {
    emit(GetVehiclesLoadingState());
    final result = await _getVehiclesUseCase.execute();
    switch (result) {
      case Success():
        emit(GetVehiclesSuccessState(result.data?.vehicles ?? []));
      case Error():
        emit(GetVehiclesErrorState(result.exception!));
    }
  }
}
