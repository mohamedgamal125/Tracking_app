import 'package:tracking_app/core/common/result.dart';
import 'package:injectable/injectable.dart';

import '../entity/profile_response_entity.dart';
import '../repository/profile_screen_repository.dart';

@injectable
class EditVehicleUseCase {
  final ProfileRepository _profileRepository;

  EditVehicleUseCase(this._profileRepository);

  Future<Result<ProfileResponseEntity>> execute(
    Map<String, dynamic> data,
  ) async {
    return await _profileRepository.editVehicle(data['name'], data['image']);
  }
}
