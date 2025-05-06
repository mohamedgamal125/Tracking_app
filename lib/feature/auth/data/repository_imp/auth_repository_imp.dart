import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/auth/data/data_source/auth_local_data_source.dart';

import '../../../../core/api/api_execute.dart';
import '../../../../core/common/result.dart';
import '../../../../core/services/shared_preference_services.dart';
import '../../../../core/utils/constant_manager.dart';
import '../../domain/entity/reset_password_response_entity.dart';
import '../../domain/entity/sign_in_request.dart';
import '../../domain/entity/sign_in_response_entity.dart';
import '../../domain/entity/verify_email_response_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';
import '../model/forget_response_password_dto.dart';
import '../model/sign_in_response_dto.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(
      this._authRemoteDataSource,
      this._authLocalDataSource,
      );

  @override
  Future<Result<SignUpResponseEntity>> signIn(SignInRequest data) async {
    return await executeApi(() async {
      final SignInResponseDTO response =
      await _authRemoteDataSource.signIn(data);

        await SharedPreferenceServices.saveData(
          AppConstants.token,
          response.token!,
        );
        log('Token: ${response.token}');
        return response;
    });

  }

  @override
  Future<Result<ForgetResponsePasswordDto>> forgetPassword(String email) async {
    return await executeApi(() async {
      final response = await _authRemoteDataSource.forgetPassword(email);
      if (response.message == "success") {
        await _authLocalDataSource.saveEmail(email);
      }
      return response;
    });
  }

  @override
  Future<Result<VerifyEmailResponseEntity>> verifyEmail(String code) async {
    return await executeApi(() async {
      final dto = await _authRemoteDataSource.verifyEmail(code);
      return dto.toEntity();
    });
  }

  @override
  Future<Result<ResetPasswordResponseEntity>> resetPassword(String email, String newPassword) async {
    return await executeApi(() async {
      final resetResponse = await _authRemoteDataSource.resetPassword(email, newPassword);
      if (resetResponse.message == "success" && resetResponse.token != null) {
        await _authLocalDataSource.saveToken(resetResponse.token!);
        return ResetPasswordResponseEntity(
          message: resetResponse.message!,
          token: resetResponse.token!,
        );
      } else {
        throw Exception(resetResponse.error ?? "Unknown error");
      }
    });
  }

  @override
  Future<void> saveEmail(String email) async {
    await _authLocalDataSource.saveEmail(email);
  }

  @override
  Future<String?> getSavedEmail() async {
    return SharedPreferenceServices.getData(AppConstants.email) as String?;
  }
}
