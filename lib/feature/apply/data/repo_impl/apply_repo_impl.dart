import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api/api_execute.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/apply/data/data_source/offline_data_source/apply_offline_data_source.dart';
import 'package:tracking_app/feature/apply/data/data_source/remote_data_source/apply_remote_data_source.dart';
import 'package:tracking_app/feature/apply/data/model/apply_request_model.dart';
import 'package:tracking_app/feature/apply/domain/entites/apply_response_entity.dart';
import 'package:tracking_app/feature/apply/domain/entites/get_vehicles_entity.dart';
import 'package:tracking_app/feature/apply/domain/repo/apply_repo.dart';

@Injectable(as: ApplyRepo)
class ApplyRepoImpl implements ApplyRepo {
  final ApplyRemoteDataSource _applyRemoteDataSource;
  final ApplyOfflineDataSource _applyOfflineDataSource;
  ApplyRepoImpl(this._applyRemoteDataSource, this._applyOfflineDataSource);
  @override
  Future<Result<ApplyResponseEntity>> apply(ApplyRequestModel request) async {
    return await executeApi(() async {
      final data = await _applyRemoteDataSource.apply(request);
      return data.toEntity();
    });
  }

  @override
  Future<Result<GetVehiclesEntity>> getAllVehicles() async {
    return await executeApi(() async {
      final data = await _applyRemoteDataSource.getAllVehicles();
      return data.toEntity();
    });
  }

  @override
  Future<List<Map<String,dynamic>>>  getCountries() {
    return _applyOfflineDataSource.getCountries();
  }
}
