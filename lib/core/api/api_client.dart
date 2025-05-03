import 'dart:io';

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
  @MultiPart()
  Future<HttpResponse<ApplyResponseDTO>> apply(
      @Body() ApplyRequestModel request,
    // @Part(name: 'country') String country,
    // @Part(name: 'firstName') String firstName,
    // @Part(name: 'lastName') String lastName,
    // @Part(name: 'vehicleType') String vehicleType,
    // @Part(name: 'vehicleNumber') String vehicleNumber,
    // @Part(name: 'vehicleLicense', contentType: "image/jpg") File vehicleLicense,
    // @Part(name: 'NID') String NID,
    // @Part(name: 'NIDImg', contentType: "image/jpg") File NIDImg,
    // @Part(name: 'email') String email,
    // @Part(name: 'password') String password,
    // @Part(name: 'rePassword') String rePassword,
    // @Part(name: 'gender') String gender,
    // @Part(name: 'phone') String phone,
  );

  @GET(ApiEndPoints.allVehicleEndPoint)
  Future<HttpResponse<GetVehiclesResponseDTO>> getAllVehicles();
}
