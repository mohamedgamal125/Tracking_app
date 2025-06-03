import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/profile/domain/entity/profile_response_entity.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_screen_repository.dart';
import 'package:tracking_app/feature/profile/domain/use_case/profile_screen_use_case.dart';

import 'profile_screen_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  // Provide a dummy value to avoid MissingDummyValueError
  provideDummy<Result<ProfileResponseEntity>>(Success(null));
  provideDummy<Result<void>>(Success(null));

  late MockProfileRepository mockRepository;
  late ProfileUseCase useCase;

  setUp(() {
    mockRepository = MockProfileRepository();
    useCase = ProfileUseCase(mockRepository);
  });

  group('ProfileUseCase', () {
    test('should return Success when getProfileData is successful', () async {
      // Arrange
      final expectedResponse = ProfileResponseEntity(message: 'Success');

      when(mockRepository.getProfileData())
          .thenAnswer((_) async => Success(expectedResponse));

      // Act
      final result = await useCase.execute();

      // Assert
      expect(result, isA<Success<ProfileResponseEntity>>());
      final success = result as Success<ProfileResponseEntity>;
      expect(success.data?.message, 'Success');
      verify(mockRepository.getProfileData()).called(1);
    });

    test('should return Error when getProfileData fails', () async {
      // Arrange
      when(mockRepository.getProfileData())
          .thenAnswer((_) async => Error('Server Error'));

      // Act
      final result = await useCase.execute();

      // Assert
      expect(result, isA<Error>());
      final error = result as Error;
      expect(error.exception, 'Server Error');
      verify(mockRepository.getProfileData()).called(1);
    });

    test('should return Success when logout is successful', () async {
      when(mockRepository.logout()).thenAnswer((_) async => Success(null));

      final result = await useCase.callLogout();

      expect(result, isA<Success<void>>());
      verify(mockRepository.logout()).called(1);
    });

    test('should return Error when logout fails', () async {
      when(mockRepository.logout()).thenAnswer((_) async => Error('Logout failed'));

      final result = await useCase.callLogout();

      expect(result, isA<Error>());
      final error = result as Error;
      expect(error.exception, 'Logout failed');
      verify(mockRepository.logout()).called(1);
    });

    test('should return token from repository', () async {
      when(mockRepository.getToken()).thenAnswer((_) async => 'myToken');

      final token = await useCase.getToken();

      expect(token, 'myToken');
      verify(mockRepository.getToken()).called(1);
    });

    test('should call deleteToken in repository', () async {
      when(mockRepository.deleteToken()).thenAnswer((_) async => Future.value());

      await useCase.deleteToken();

      verify(mockRepository.deleteToken()).called(1);
    });
  });
}
