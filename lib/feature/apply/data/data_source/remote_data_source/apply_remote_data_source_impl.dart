import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:tracking_app/core/api/api_client.dart';
import 'package:tracking_app/feature/apply/data/data_source/remote_data_source/apply_remote_data_source.dart';
import 'package:tracking_app/feature/apply/data/model/apply_request_model.dart';
import 'package:tracking_app/feature/apply/data/model/apply_response_dto.dart';
import 'package:tracking_app/feature/apply/data/model/get_vehicles_response_dto.dart';

class ApplyRemoteDataSourceImpl implements ApplyRemoteDataSource {
  final ApiClient _apiClient;
  ApplyRemoteDataSourceImpl(this._apiClient);
  @override
  Future<ApplyResponseDTO> apply(ApplyRequestModel request) async {
    // var NIDImg = FormData.fromMap({
    //   'NIDImg': await MultipartFile.fromFile(
    //     request.NIDImg!.path,
    //     filename:
    //         'upload_${DateTime.now().millisecondsSinceEpoch}.${request.NIDImg!.path.split('.').last}',
    //     contentType: MediaType.parse(lookupMimeType(request.NIDImg!.path)!),
    //   ),
    // });
    // var vehicleLicense = FormData.fromMap({
    //   'vehicleLicense': await MultipartFile.fromFile(
    //     request.vehicleLicense!.path,
    //     filename:
    //         'upload_${DateTime.now().millisecondsSinceEpoch}.${request.vehicleLicense!.path.split('.').last}',
    //     contentType:
    //         MediaType.parse(lookupMimeType(request.vehicleLicense!.path)!),
    //   ),
    // });
    final response = await _apiClient.apply(request
        // request.country!,
        // request.firstName!,
        // request.lastName!,
        // request.vehicleType!,
        // request.vehicleNumber!,
        // request.vehicleLicense!,
        // request.NID!,
        // request.NIDImg!,
        // request.email!,
        // request.password!,
        // request.rePassword!,
        // request.gender!,
        // request.phone!,
        );
    return response.data;
  }

  @override
  Future<GetVehiclesResponseDTO> getAllVehicles() async {
    final response = await _apiClient.getAllVehicles();
    return response.data;
  }
}
