import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/auth/data/data_source/auth_local_data_source.dart';
import 'package:tracking_app/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:tracking_app/feature/auth/data/model/forget_response_password_dto.dart';
import 'package:tracking_app/feature/auth/data/model/reset_password_dto.dart';
import 'package:tracking_app/feature/auth/data/model/verify_email_response_dto.dart';
import 'package:tracking_app/feature/auth/data/repository_imp/auth_repository_imp.dart';
import 'package:tracking_app/feature/auth/domain/entity/reset_password_response_entity.dart';
import 'package:tracking_app/feature/auth/domain/entity/verify_email_response_entity.dart';

import 'auth_repository_imp_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource, AuthLocalDataSource])
void main() {
  late AuthRemoteDataSource remoteDataSource;
  late AuthLocalDataSource localDataSource;
  late AuthRepositoryImpl repository;

  provideDummy<Result<ForgetResponsePasswordDto>>(Success(ForgetResponsePasswordDto(message: "success")));
  provideDummy<Result<VerifyEmailResponseEntity>>(Success(VerifyEmailResponseEntity()));
  provideDummy<Result<ResetPasswordResponseEntity>>(Success(ResetPasswordResponseEntity(message: "success", token: "123")));

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSource();
    localDataSource = MockAuthLocalDataSource();
    repository = AuthRepositoryImpl(remoteDataSource, localDataSource);
  });

  group('AuthRepositoryImpl tests', () {
    test("Should call forgetPassword and save email if success", () async {
      const email = "test@example.com";
      final dto = ForgetResponsePasswordDto(message: "success");

      when(remoteDataSource.forgetPassword(email))
          .thenAnswer((_) async => dto);
      when(localDataSource.saveEmail(email))
          .thenAnswer((_) async => {});

      final result = await repository.forgetPassword(email);

      verify(remoteDataSource.forgetPassword(email)).called(1);
      verify(localDataSource.saveEmail(email)).called(1);

      expect(result, isA<Success<ForgetResponsePasswordDto>>());
    });

    test("Should call verifyEmail and return success", () async {
      const code = "123456";
      final dto = VerifyEmailResponseDto(status: "Verified", message: "Success", code: 200);

      when(remoteDataSource.verifyEmail(code))
          .thenAnswer((_) async => dto);

      final result = await repository.verifyEmail(code);

      verify(remoteDataSource.verifyEmail(code)).called(1);
      expect(result, isA<Success<VerifyEmailResponseEntity>>());
      expect((result as Success<VerifyEmailResponseEntity>).data?.status, "Verified");
    });
    test("Should call resetPassword and save token if success", () async {
      const email = "test@example.com";
      const password = "newpassword";
      final dto = ResetPasswordResponseDTO(message: "success", token: "abc123");

      when(remoteDataSource.resetPassword(email, password))
          .thenAnswer((_) async => dto);

      when(localDataSource.saveToken("abc123"))
          .thenAnswer((_) async => {});

      final result = await repository.resetPassword(email, password);

      verify(remoteDataSource.resetPassword(email, password)).called(1);
      verify(localDataSource.saveToken("abc123")).called(1);
      expect(result, isA<Success<ResetPasswordResponseEntity>>());
      expect((result as Success<ResetPasswordResponseEntity>).data?.token, "abc123");
    });
  });
}
