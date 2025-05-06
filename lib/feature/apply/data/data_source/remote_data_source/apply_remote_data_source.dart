import 'package:tracking_app/feature/apply/data/model/apply_request_model.dart';
import 'package:tracking_app/feature/apply/data/model/apply_response_dto.dart';
import 'package:tracking_app/feature/apply/data/model/get_vehicles_response_dto.dart';

abstract class ApplyRemoteDataSource {
  Future<ApplyResponseDTO> apply(ApplyRequestModel request);
  Future<GetVehiclesResponseDTO> getAllVehicles();
}
