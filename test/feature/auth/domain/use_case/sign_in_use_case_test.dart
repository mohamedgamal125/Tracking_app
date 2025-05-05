import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/sign_in_request.dart';
import 'package:tracking_app/feature/auth/domain/entity/sign_in_response_entity.dart';
import 'package:tracking_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:tracking_app/feature/auth/domain/use_case/sign_in_use_case.dart';

import 'sign_in_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late SignInUseCase signInUseCase;

  provideDummy<Result<SignUpResponseEntity>>(Success(SignUpResponseEntity(token: "dummy_token")));

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signInUseCase = SignInUseCase(mockAuthRepository);
  });

  group("SignInUseCase Test", () {
    test("should call signIn from repository and return Success", () async {

      final request = SignInRequest(email: "test@example.com", password: "123456");
      final expectedResponse = SignUpResponseEntity(token: "abc123");
      final expectedResult = Success(expectedResponse);

      when(mockAuthRepository.signIn(request)).thenAnswer((_) async => expectedResult);

      final result = await signInUseCase.execute(request);

      verify(mockAuthRepository.signIn(request)).called(1);
      expect(result, isA<Success<SignUpResponseEntity>>());
      expect((result as Success<SignUpResponseEntity>).data?.token, "abc123");
    });
  });
}
