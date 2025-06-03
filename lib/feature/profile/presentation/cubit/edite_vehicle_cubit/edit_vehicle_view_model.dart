import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/di/injectable_initializer.dart';
import '../../../../../core/common/result.dart';
import '../../../domain/use_case/edit_vehicle_use_case.dart';
import '../profile_view_model.dart';
import 'edit_vehivle_state.dart';

@injectable
class EditVehicleViewModel extends Cubit<EditVehicleState> {
  final EditVehicleUseCase _editVehicleUseCase;
  EditVehicleViewModel(this._editVehicleUseCase)
      : super(EditVehicleInitialState());

  void editVehicle(Map<String, dynamic> data) async {
    emit(EditVehicleLoadingState());
    final result = await _editVehicleUseCase.execute(data);
    switch (result) {
      case Success():
        emit(EditVehicleSuccessState(data: result.data!));
        getIt.get<ProfileViewModel>().doIntent(ProfileClickedIntent());

      case Error():
        emit(EditVehicleErrorState(result.exception!));
    }
  }
}
