
import '../../../domain/entity/sign_in_response_entity.dart';

sealed class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
  final SignUpResponseEntity data;
  SignInSuccessState(this.data);
}

class SignInErrorState extends SignInState {
  final String message;
  SignInErrorState(this.message);
}
