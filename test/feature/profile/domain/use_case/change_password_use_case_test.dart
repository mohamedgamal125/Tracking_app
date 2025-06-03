import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/profile/domain/use_case/change_password_use_case.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_screen_repository.dart';
import 'package:tracking_app/feature/profile/domain/entity/change_password_entity.dart';
import 'package:tracking_app/feature/profile/data/model/change_password_request_model.dart';

import 'change_password_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  // Register dummy value so mockito can create stubs
  provideDummy<Result<ChangePasswordEntity>>(Success(null));

  late MockProfileRepository mockRepository;
  late ChangePasswordUseCase useCase;

  setUp(() {
    mockRepository = MockProfileRepository();
    useCase = ChangePasswordUseCase(mockRepository);
  });

  group('ChangePasswordUseCase', () {
    test('should return Success when password is changed successfully', () async {
      // Arrange
      final request = ChangePasswordRequestModel(
        oldPassword: 'old123',
        newPassword: 'new123',
        // confirmPassword: 'new123',
      );

      final expectedResponse = ChangePasswordEntity(message: 'Password changed');

      when(mockRepository.changePassword(request))
          .thenAnswer((_) async => Success(expectedResponse));

      // Act
      final result = await useCase.execute(request);

      // Assert
      expect(result, isA<Success<ChangePasswordEntity>>());
      final success = result as Success<ChangePasswordEntity>;
      expect(success.data?.message, 'Password changed');
      verify(mockRepository.changePassword(request)).called(1);
    });

    test('should return Error when password change fails', () async {
      // Arrange
      final request = ChangePasswordRequestModel(
        oldPassword: 'wrongOld',
        newPassword: 'new123',
        // confirmPassword: 'new123',
      );

      when(mockRepository.changePassword(request))
          .thenAnswer((_) async => Error('Old password incorrect'));

      // Act
      final result = await useCase.execute(request);

      // Assert
      expect(result, isA<Error>());
      final error = result as Error;
      expect(error.exception, 'Old password incorrect');
      verify(mockRepository.changePassword(request)).called(1);
    });
  });
}
