import 'dart:developer';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_client.dart';
import '../model/forget_response_password_dto.dart';
import '../model/reset_password_dto.dart';
import '../model/verify_email_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<ForgetResponsePasswordDto> forgetPassword(String email);
  Future<VerifyEmailResponseDto> verifyEmail(String code);
  Future<ResetPasswordResponseDTO> resetPassword(
    String email,
    String newPassword,
  );
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;
  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ForgetResponsePasswordDto> forgetPassword(String email) async {
    return await _apiClient.forgetPassword({"email": email});
  }

  @override
  Future<VerifyEmailResponseDto> verifyEmail(String code) async {
    return await _apiClient.verifyEmail({"resetCode": code});
  }

  @override
  Future<ResetPasswordResponseDTO> resetPassword(String email, String newPassword,) async {
    log("Resetting password for :$email");
    return await _apiClient.resetPassword({
      "email": email,
      "newPassword": newPassword,
    });
  }

}
