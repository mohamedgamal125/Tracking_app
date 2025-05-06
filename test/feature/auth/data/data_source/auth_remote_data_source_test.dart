import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api/api_client.dart';
import 'package:tracking_app/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:tracking_app/feature/auth/data/model/forget_response_password_dto.dart';
import 'package:tracking_app/feature/auth/data/model/reset_password_dto.dart';
import 'package:tracking_app/feature/auth/data/model/sign_in_response_dto.dart';
import 'package:tracking_app/feature/auth/data/model/verify_email_response_dto.dart';
import 'package:tracking_app/feature/auth/domain/entity/sign_in_request.dart';

import 'auth_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late ApiClient apiClient;
  late AuthRemoteDataSourceImpl dataSource;

  setUp(() {
    apiClient = MockApiClient();
    dataSource = AuthRemoteDataSourceImpl(apiClient);
  });

  group('AuthRemoteDataSourceImpl', () {
    test("Should return SignInResponseDTO when calling signIn", () async {
      final request = SignInRequest(email: "test@example.com", password: "password123");
      final responseDto = SignInResponseDTO(
        token: "abc123",
        message: 'successes'
      );

      when(apiClient.signIn(request)).thenAnswer((_) async => responseDto);

      final result = await dataSource.signIn(request);

      verify(apiClient.signIn(request)).called(1);
      expect(result, responseDto);
    });

    test("Should return ForgetResponsePasswordDto when calling forgetPassword", () async {
      const email = "test@example.com";
      final responseDto = ForgetResponsePasswordDto(message: "Email sent");

      when(apiClient.forgetPassword({"email": email}))
          .thenAnswer((_) async => responseDto);

      final result = await dataSource.forgetPassword(email);

      verify(apiClient.forgetPassword({"email": email})).called(1);
      expect(result, responseDto);
    });

    test("Should return VerifyEmailResponseDto when calling verifyEmail", () async {
      const code = "123456";
      final responseDto = VerifyEmailResponseDto(
        status: "Verified",
        message: "Success",
        code: 200,
      );

      when(apiClient.verifyEmail({"resetCode": code}))
          .thenAnswer((_) async => responseDto);

      final result = await dataSource.verifyEmail(code);

      verify(apiClient.verifyEmail({"resetCode": code})).called(1);
      expect(result, responseDto);
    });

    test("Should return ResetPasswordResponseDTO when calling resetPassword", () async {
      const email = "test@example.com";
      const newPassword = "newpassword";
      final responseDto = ResetPasswordResponseDTO(
        message: "Password reset successful",
        token: "abc123",
      );

      when(apiClient.resetPassword({
        "email": email,
        "newPassword": newPassword,
      })).thenAnswer((_) async => responseDto);

      final result = await dataSource.resetPassword(email, newPassword);

      verify(apiClient.resetPassword({
        "email": email,
        "newPassword": newPassword,
      })).called(1);
      expect(result, responseDto);
    });
  });
}
