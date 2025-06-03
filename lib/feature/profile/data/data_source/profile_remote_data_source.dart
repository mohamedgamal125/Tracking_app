import 'dart:developer';
import 'dart:io';
import 'package:mime/mime.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:http_parser/http_parser.dart';

import '../../../../../core/api/api_client.dart';
import '../../../../core/api/api_execute.dart';
import '../../../../core/common/result.dart';
import '../../domain/entity/change_password_entity.dart';
import '../model/change_password_request_model.dart';
import '../model/profile_response_dto.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileResponseDTO> getProfileData();
  Future<ProfileResponseDTO> editProfile(Map<String, dynamic> data);
  Future<ProfileResponseDTO> editVehicle(File image, String name);
  Future<Result<String?>> uploadPhoto(File photo);
  Future<Result<ChangePasswordEntity>> changePassword(
      ChangePasswordRequestModel data);
  Future<void> logout();
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiClient _apiClient;

  ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ProfileResponseDTO> getProfileData() async {
    return await _apiClient.getProfileData();
  }

  @override
  Future<ProfileResponseDTO> editProfile(Map<String, dynamic> data) async {
    ProfileResponseDTO response = await _apiClient.editProfile(data);
    return response;
  }

  @override
  Future<ProfileResponseDTO> editVehicle(File image, String name) async {
    Map<String, dynamic> map = {'name': name, 'image': image};
    ProfileResponseDTO response =
        await _apiClient.editVehicle(map, name, image);
    return response;
  }

  @override
  Future<Result<String?>> uploadPhoto(File photo) async {
    return await executeApi<String?>(() async {
      final mimeType = lookupMimeType(photo.path);
      var formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(
          photo.path,
          filename:
              'upload_${DateTime.now().millisecondsSinceEpoch}.${photo.path.split('.').last}',
          contentType: MediaType.parse(mimeType!),
        ),
      });
      var response = await _apiClient.uploadPhoto(formData);
      return response;
    });
  }

  @override
  Future<Result<ChangePasswordEntity>> changePassword(
    ChangePasswordRequestModel data,
  ) async {
    return executeApi(() async {
      var response = await _apiClient.changePassword(
        data,
      );
      log("response ${response.message}");
      return response;
    });
  }

  @override
  Future<void> logout() async {
    await _apiClient.logout();
  }
}
