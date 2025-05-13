import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/auth/presentation/cubit/reset_password_cubit/reset_password_state.dart';

import '../../../../../core/common/result.dart';
import '../../../domain/use_case/auth_use_case.dart';


@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordState> {
  ResetPasswordViewModel(this._authUseCase) : super(ResetPasswordInitial());

  final AuthUseCase _authUseCase;

  void resetPassword(String email, String newPassword) async {
    emit(ResetPasswordLoading());
    var result = await _authUseCase.callResetPassword(email, newPassword);
    switch (result) {
      case Success():
        if (result.data != null) {
          emit(ResetPasswordSuccess(result.data!));
        } else {
          emit(ResetPasswordError("Error"));
        }
        break;

      case Error():
        emit(ResetPasswordError(result.exception.toString()));
        break;
    }
  }
}
