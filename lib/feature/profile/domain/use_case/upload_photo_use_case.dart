import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';
import '../repository/profile_screen_repository.dart';

@injectable
class UploadPhotoUseCase {
  final ProfileRepository _profileRepository;

  UploadPhotoUseCase(this._profileRepository);

  Future<Result<String?>> execute(File photo) async {
    return await _profileRepository.uploadPhoto(photo);
  }
}
