import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'forget_password_state.dart';
import '../../../../../core/common/result.dart';
import '../../../domain/use_case/auth_use_case.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  ForgetPasswordViewModel(this._authUseCase)
      : super(LoadingForgetPasswordState());

  final AuthUseCase _authUseCase;
  final email = TextEditingController();
  final GlobalKey<FormState> formForgetKey = GlobalKey<FormState>();

  bool hasInteractedWithEmail = false;

  void setEmailInteraction(bool interacted) {
    hasInteractedWithEmail = interacted;
    emit(state); // Trigger rebuild
  }

  void doIntent(ForgetPasswordIntent forgetPasswordIntent) {
    switch (forgetPasswordIntent) {
      case ContinueClickedIntent():
        if (formForgetKey.currentState!.validate()) {
          _fetchPassword(email.text);
        }
    }
  }

  void _fetchPassword(String email) async {
    emit(LoadingForgetPasswordState());
    final result = await _authUseCase.callForgetPassword(email);
    switch (result) {
      case Success():
        final data = result.data;
        if (data?.message == "success") {
          emit(SuccessForgetPasswordState(data));
        } else {
          emit(ErrorForgetPasswordState(data?.message ?? "Unknown error"));
        }
      case Error():
        emit(ErrorForgetPasswordState(result.exception ?? "Unknown exception"));
    }
  }
}

sealed class ForgetPasswordIntent {}

class ContinueClickedIntent extends ForgetPasswordIntent {}
