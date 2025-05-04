import '../../../../core/common/result.dart';
import '../entity/forget_response_password_entity.dart';
import '../entity/reset_password_response_entity.dart';
import '../entity/verify_email_response_entity.dart';

abstract class AuthRepository {
  Future<Result<ForgetResponsePasswordEntity>> forgetPassword(String email);
  Future<Result<VerifyEmailResponseEntity>> verifyEmail(String code);
  Future<Result<ResetPasswordResponseEntity>> resetPassword(
    String email,
    String newPassword,
  );

  Future<void> saveEmail(String email);
  Future<String?> getSavedEmail();
}
