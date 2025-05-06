import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_state.dart';

import '../../../../../core/common/result.dart';
import '../../../domain/entity/sign_in_request.dart';
import '../../../domain/use_case/sign_in_use_case.dart';

@injectable
class SignInViewModel extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;
  SignInViewModel(this._signInUseCase) : super(SignInInitialState());

  void signIn(SignInRequest data) async {
    emit(SignInLoadingState());
    var result = await _signInUseCase.execute(data);
    switch (result) {
      case Success():
        emit(SignInSuccessState(result.data!));
      case Error():
        emit(SignInErrorState(result.exception!));
    }
  }
}
