import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/apply/domain/entites/get_vehicles_entity.dart';
import 'package:tracking_app/feature/apply/domain/repo/apply_repo.dart';

class GetVehiclesUseCase {
  final ApplyRepo _applyRepo;

  GetVehiclesUseCase(this._applyRepo);

  Future<Result<GetVehiclesEntity>> getAllVehicles() async {
    return await _applyRepo.getAllVehicles();
  }
}
