import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/profile/data/data_source/profile_local_data_source.dart';
import 'package:tracking_app/feature/profile/data/data_source/profile_remote_data_source.dart';
import 'package:tracking_app/feature/profile/data/model/change_password_request_model.dart';
import 'package:tracking_app/feature/profile/data/model/profile_response_dto.dart';
import 'package:tracking_app/feature/profile/data/repository_imp/profile_screen_repository_imp.dart';
import 'package:tracking_app/feature/profile/domain/entity/change_password_entity.dart';
import 'package:tracking_app/feature/profile/domain/entity/profile_response_entity.dart';

import 'profile_screen_repository_imp_test.mocks.dart';

@GenerateMocks([ProfileRemoteDataSource, ProfileLocalDataSource])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //
  // provideDummyBuilder<Result<ChangePasswordEntity>>(
  //       () => Success(ChangePasswordEntity(message: '')),
  // );
  //
  // provideDummyBuilder<Result<String?>>(() => const Success<String?>(''));


  late ProfileRemoteDataSource remoteDataSource;
  late ProfileLocalDataSource localDataSource;
  late ProfileRepositoryImpl repository;

  setUp(() {
    remoteDataSource = MockProfileRemoteDataSource();
    localDataSource = MockProfileLocalDataSource();
    repository = ProfileRepositoryImpl(remoteDataSource, localDataSource);
  });

  group('ProfileRepositoryImpl tests', () {
    test("Should get profile data successfully", () async {
      final dto = ProfileResponseDTO(
        driver: DriverDTO(email: 'test@example.com'),
      );
      when(remoteDataSource.getProfileData()).thenAnswer((_) async => dto);

      final result = await repository.getProfileData();

      verify(remoteDataSource.getProfileData()).called(1);
      expect(result, isA<Success<ProfileResponseEntity>>());
    });

    // test("Should edit profile successfully", () async {
    //   // Arrange
    //   final dto = ProfileResponseDTO(
    //     driver: DriverDTO(email: 'test@example.com'),
    //   );
    //   final inputData = {"email": "updated@example.com"};
    //
    //   when(remoteDataSource.editProfile(typed(any<Map<String, dynamic>>(), named: 'data')))
    //
    //
    //   // Act
    //   final result = await repository.editProfile(inputData);
    //
    //   // Assert
    //   final verification = verify(remoteDataSource.editProfile(captureAny));
    //   verification.called(1);
    //
    //   final capturedArg = verification.captured.single;
    //   expect(capturedArg, isA<Map<String, dynamic>>());
    //   expect((capturedArg as Map<String, dynamic>)['email'], "updated@example.com");
    //
    //   expect(result, isA<Success<ProfileResponseEntity>>());
    // });

    test("Should change password successfully", () async {
      final request = ChangePasswordRequestModel(oldPassword: "123", newPassword: "456");
      final entity = ChangePasswordEntity(message: "Password updated");

      when(remoteDataSource.changePassword(request))
          .thenAnswer((_) async => Success(entity));

      final result = await repository.changePassword(request);

      verify(remoteDataSource.changePassword(request)).called(1);
      expect(result, isA<Success<ChangePasswordEntity>>());
    });

    test("Should logout and delete token", () async {
      when(remoteDataSource.logout()).thenAnswer((_) async => {});
      when(localDataSource.deleteToken()).thenAnswer((_) async => {});

      final result = await repository.logout();

      verify(remoteDataSource.logout()).called(1);
      verify(localDataSource.deleteToken()).called(1);
      expect(result, isA<Success<void>>());
    });

    test("Should get token from local data source", () async {
      when(localDataSource.getToken()).thenAnswer((_) async => "token_xyz");

      final token = await repository.getToken();

      verify(localDataSource.getToken()).called(1);
      expect(token, "token_xyz");
    });

    test("Should delete token using local data source", () async {
      when(localDataSource.deleteToken()).thenAnswer((_) async => {});

      await repository.deleteToken();

      verify(localDataSource.deleteToken()).called(1);
    });

    test("Should upload photo successfully", () async {
      final file = File('test.jpg');
      when(remoteDataSource.uploadPhoto(file))
          .thenAnswer((_) async => Success("uploaded_url"));

      final result = await repository.uploadPhoto(file);

      verify(remoteDataSource.uploadPhoto(file)).called(1);
      expect(result, isA<Success<String?>>());
      expect((result as Success<String?>).data, "uploaded_url");
    });
  });
}

