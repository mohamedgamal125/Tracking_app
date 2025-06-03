import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../../data/model/change_password_request_model.dart';
import '../entity/change_password_entity.dart';
import '../repository/profile_screen_repository.dart';

@injectable
class ChangePasswordUseCase {
  final ProfileRepository _profileRepository;

  ChangePasswordUseCase(this._profileRepository);

  Future<Result<ChangePasswordEntity>> execute(
    ChangePasswordRequestModel data,
  ) {
    return _profileRepository.changePassword(data);
  }
}
