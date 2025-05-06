import '../../../domain/entity/reset_password_response_entity.dart';

sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordResponseEntity response;

  ResetPasswordSuccess(this.response);
}

class ResetPasswordError extends ResetPasswordState {
  final String error;
  ResetPasswordError(this.error);
}
