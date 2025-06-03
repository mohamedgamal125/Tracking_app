import 'package:tracking_app/core/common/result.dart';
import 'package:injectable/injectable.dart';

import '../entity/profile_response_entity.dart';
import '../repository/profile_screen_repository.dart';

@injectable
class EditProfileUseCase {
  final ProfileRepository _profileRepository;

  EditProfileUseCase(this._profileRepository);

  Future<Result<ProfileResponseEntity>> execute(
    Map<String, dynamic> data,
  ) async {
    return await _profileRepository.editProfile(data);
  }
}
