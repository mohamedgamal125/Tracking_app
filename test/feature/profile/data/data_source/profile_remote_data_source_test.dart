import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api/api_client.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/profile/data/data_source/profile_remote_data_source.dart';
import 'package:tracking_app/feature/profile/data/model/change_password_request_model.dart';
import 'package:tracking_app/feature/profile/data/model/profile_response_dto.dart';
import 'package:tracking_app/feature/profile/data/model/change_password_dto.dart';
import 'package:tracking_app/feature/profile/domain/entity/change_password_entity.dart';

import '../../../auth/data/data_source/auth_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late ProfileRemoteDataSourceImpl dataSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = ProfileRemoteDataSourceImpl(mockApiClient);
  });

  test("getProfileData should return ProfileResponseDTO", () async {
    final dto = ProfileResponseDTO(driver: DriverDTO(email: "test@test.com"));
    when(mockApiClient.getProfileData()).thenAnswer((_) async => dto);

    final result = await dataSource.getProfileData();

    expect(result.driver?.email, equals("test@test.com"));
    verify(mockApiClient.getProfileData()).called(1);
  });

  test("editProfile should return ProfileResponseDTO", () async {
    final data = {"email": "updated@test.com"};
    final dto = ProfileResponseDTO(driver: DriverDTO(email: "updated@test.com"));
    when(mockApiClient.editProfile(data)).thenAnswer((_) async => dto);

    final result = await dataSource.editProfile(data);

    expect(result.driver?.email, equals("updated@test.com"));
    verify(mockApiClient.editProfile(data)).called(1);
  });
 //++++++++++++++++++++++++++++++++++++++++++//
  test("uploadPhoto should return Success<String?>", () async {
    final file = File("test.jpg");
    when(mockApiClient.uploadPhoto(any)).thenAnswer((_) async => "photo_url");

    final result = await dataSource.uploadPhoto(file);

    expect(result, isA<Success<String?>>());
    expect((result as Success).data, equals("photo_url"));
    verify(mockApiClient.uploadPhoto(any)).called(1);
  });

  test("changePassword should return Success<ChangePasswordEntity>", () async {
    final request = ChangePasswordRequestModel(oldPassword: "123", newPassword: "456");
    final response = ChangePasswordDTO(message: "Password updated");

    when(mockApiClient.changePassword(request)).thenAnswer((_) async => response);

    final result = await dataSource.changePassword(request);

    expect(result, isA<Success<ChangePasswordEntity>>());
    expect((result as Success).data?.message, equals("Password updated"));
    verify(mockApiClient.changePassword(request)).called(1);
  });

  test("logout should complete without errors", () async {
    when(mockApiClient.logout()).thenAnswer(
          (_) async => FakeHttpResponse<void>(
        null,
        Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
        ),
      ),
    );
    await dataSource.logout();
    verify(mockApiClient.logout()).called(1);
  });

}

class FakeHttpResponse<T> implements HttpResponse<T> {
  @override
  final T data;

  @override
  final Response response;

  FakeHttpResponse(this.data, this.response);
}
