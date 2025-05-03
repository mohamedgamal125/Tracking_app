import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tracking_app/core/utils/end_points.dart';
import 'package:tracking_app/feature/apply/data/model/apply_request_model.dart';
import 'package:tracking_app/feature/apply/data/model/apply_response_dto.dart';
import 'package:tracking_app/feature/apply/data/model/get_vehicles_response_dto.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://flower.elevateegy.com/api/v1/drivers/")
@singleton
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST(ApiEndPoints.applyEndPoint)
  Future<HttpResponse<ApplyResponseDTO>> apply(ApplyRequestModel request);

  @GET(ApiEndPoints.allVehicleEndPoint)
  Future<HttpResponse<GetVehiclesResponseDTO>> getAllVehicles();
}
