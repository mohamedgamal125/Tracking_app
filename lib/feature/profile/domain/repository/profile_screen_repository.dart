import 'dart:io';

import '../../../../../core/common/result.dart';
import '../../data/model/change_password_request_model.dart';
import '../entity/change_password_entity.dart';
import '../entity/profile_response_entity.dart';

abstract class ProfileRepository {

  Future<Result<ProfileResponseEntity>> getProfileData();
  Future<Result<ProfileResponseEntity>> editProfile(Map<String, dynamic> data);
  Future<Result<String?>> uploadPhoto(File photo);
  Future<Result<void>> logout();
  Future<String?> getToken();
  Future<void> deleteToken();
  Future<Result<ChangePasswordEntity>> changePassword(ChangePasswordRequestModel data,);
}
