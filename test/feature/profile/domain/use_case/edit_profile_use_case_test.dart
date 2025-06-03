import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/profile/domain/entity/profile_response_entity.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_screen_repository.dart';
import 'package:tracking_app/feature/profile/domain/use_case/edit_profile_use_case.dart';

import 'edit_profile_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  // 👇 Provide dummy value for Result<ProfileResponseEntity>
  TestWidgetsFlutterBinding.ensureInitialized();
  provideDummy<Result<ProfileResponseEntity>>(Success(null));

  late MockProfileRepository mockRepository;
  late EditProfileUseCase useCase;

  setUp(() {
    mockRepository = MockProfileRepository();
    useCase = EditProfileUseCase(mockRepository);
  });

  group('EditProfileUseCase', () {
    test('should return ProfileResponseEntity when editProfile is successful', () async {
      // Arrange
      final data = {
        'firstName': 'John',
        'lastName': 'Doe',
        'email': 'john@example.com',
      };

      final expectedResponse = ProfileResponseEntity(
        message: 'Profile updated',
        driver: DriverEntity(
          firstName: 'John',
          lastName: 'Doe',
          email: 'john@example.com',
        ),
      );

      when(mockRepository.editProfile(data))
          .thenAnswer((_) async => Success(expectedResponse));

      // Act
      final result = await useCase.execute(data);

      // Assert
      expect(result, isA<Success<ProfileResponseEntity>>());
      final success = result as Success<ProfileResponseEntity>;
      expect(success.data?.driver?.email, 'john@example.com');
      verify(mockRepository.editProfile(data)).called(1);
    });

    test('should return Error when editProfile fails', () async {
      // Arrange
      final data = {'email': 'invalid'};

      when(mockRepository.editProfile(data))
          .thenAnswer((_) async => Error('Invalid email'));

      // Act
      final result = await useCase.execute(data);

      // Assert
      expect(result, isA<Error>());
      final error = result as Error;
      expect(error.exception, 'Invalid email');
      verify(mockRepository.editProfile(data)).called(1);
    });
  });
}
