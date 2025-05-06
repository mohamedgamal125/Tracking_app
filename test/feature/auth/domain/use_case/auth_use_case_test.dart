import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/forget_response_password_entity.dart';
import 'package:tracking_app/feature/auth/domain/entity/reset_password_response_entity.dart';
import 'package:tracking_app/feature/auth/domain/entity/verify_email_response_entity.dart';
import 'package:tracking_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:tracking_app/feature/auth/domain/use_case/auth_use_case.dart';

import 'auth_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {

  provideDummy<Result<ForgetResponsePasswordEntity>>(Success(ForgetResponsePasswordEntity()));
  provideDummy<Result<VerifyEmailResponseEntity>>(Success(VerifyEmailResponseEntity()));
  provideDummy<Result<ResetPasswordResponseEntity>>(Success(ResetPasswordResponseEntity()));
  late MockAuthRepository mockAuthRepository;
  late AuthUseCase useCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = AuthUseCase(mockAuthRepository);
  });

  group('AuthUseCase Test', () {
    test('should call forgetPassword from repository', () async {
      // arrange
      final email = "test@example.com";
      final expectedResult = Success(ForgetResponsePasswordEntity());
      when(mockAuthRepository.forgetPassword(email)).thenAnswer((_) async => expectedResult);

      // act
      final result = await useCase.callForgetPassword(email);

      // assert
      verify(mockAuthRepository.forgetPassword(email)).called(1);
      expect(result, expectedResult);
    });

    test('should call verifyEmail from repository', () async {
      // arrange
      final code = "123456";
      final expectedResult = Success(VerifyEmailResponseEntity());
      when(mockAuthRepository.verifyEmail(code)).thenAnswer((_) async => expectedResult);

      // act
      final result = await useCase.callVerifyEmail(code);

      // assert
      verify(mockAuthRepository.verifyEmail(code)).called(1);
      expect(result, expectedResult);
    });

    test('should call resetPassword from repository', () async {
      // arrange
      final email = "test@example.com";
      final password = "newPassword123";
      final expectedResult = Success(ResetPasswordResponseEntity());
      when(mockAuthRepository.resetPassword(email, password)).thenAnswer((_) async => expectedResult);

      // act
      final result = await useCase.callResetPassword(email, password);

      // assert
      verify(mockAuthRepository.resetPassword(email, password)).called(1);
      expect(result, expectedResult);
    });

    test('should call getSavedEmail from repository', () async {
      // arrange
      final expectedEmail = "saved@example.com";
      when(mockAuthRepository.getSavedEmail()).thenAnswer((_) async => expectedEmail);

      // act
      final result = await useCase.getSavedEmail();

      // assert
      verify(mockAuthRepository.getSavedEmail()).called(1);
      expect(result, expectedEmail);
    });
  });
}

