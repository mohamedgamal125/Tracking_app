import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../../../domain/use_case/auth_use_case.dart';
import 'verify_email_state.dart';

@injectable
class VerifyEmailViewModel extends Cubit<VerifyEmailState> {
  VerifyEmailViewModel(this._auth) : super(LoadingVerifyEmailState());

  final AuthUseCase _auth;

  void verifyEmail(String code) async {
    emit(LoadingVerifyEmailState());
    final result = await _auth.callVerifyEmail(code);
    switch (result) {
      case Success():
        final data = result.data;
        if (data?.status == "Success") {
          emit(SuccessVerifyEmailState());
        } else {
          emit(ErrorVerifyEmailState("Something went wrong"));
        }
      case Error():
        emit(ErrorVerifyEmailState(result.exception!));
    }
  }

  Future<void> resendCode() async {
    emit(LoadingResendEmailState());
    final email = await _auth.getSavedEmail();
    if (email == null) {
      emit(ErrorResendEmailState("No saved email"));
      return;
    }

    final result = await _auth.callForgetPassword(email);
    switch (result) {
      case Success():
        if (result.data?.message == "success") {
          emit(SuccessResendEmailState());
        } else {
          emit(ErrorResendEmailState(result.data?.message ?? "Unknown error"));
        }
      case Error():
        emit(ErrorResendEmailState(result.exception!));
    }
  }
}


sealed class VerifyEmailIntent {}

class ContinueClickedIntent extends VerifyEmailIntent {}

class ResendClickedIntent extends VerifyEmailIntent {}

class DisposeEmailIntent extends VerifyEmailIntent {}
