import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/apply/data/model/apply_request_model.dart';
import 'package:tracking_app/feature/apply/domain/entites/apply_response_entity.dart';
import 'package:tracking_app/feature/apply/domain/entites/get_vehicles_entity.dart';

abstract class ApplyRepo {
  Future<Result<ApplyResponseEntity>> apply(ApplyRequestModel request);
  Future<Result<GetVehiclesEntity>> getAllVehicles();
  Future<List> getCountries();
}
