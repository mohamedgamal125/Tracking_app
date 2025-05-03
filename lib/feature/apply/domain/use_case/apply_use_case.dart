import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/apply/data/model/apply_request_model.dart';
import 'package:tracking_app/feature/apply/domain/entites/apply_response_entity.dart';
import 'package:tracking_app/feature/apply/domain/repo/apply_repo.dart';

class ApplyUseCase {
  final ApplyRepo _applyRepo;

  ApplyUseCase(this._applyRepo);

  Future<Result<ApplyResponseEntity>> execute(ApplyRequestModel request) async {
    return await _applyRepo.apply(request);
  }
}
