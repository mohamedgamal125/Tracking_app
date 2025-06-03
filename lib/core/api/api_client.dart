import 'package:dio/dio.dart';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tracking_app/core/utils/end_points.dart';
import 'package:tracking_app/feature/home/data/model/pending_orders_response_dto.dart';

import '../../feature/auth/data/model/forget_response_password_dto.dart';
import '../../feature/auth/data/model/reset_password_dto.dart';
import '../../feature/auth/data/model/sign_in_response_dto.dart';
import '../../feature/auth/data/model/verify_email_response_dto.dart';
import '../../feature/auth/domain/entity/sign_in_request.dart';
import 'package:tracking_app/feature/apply/data/model/apply_response_dto.dart';
import 'package:tracking_app/feature/apply/data/model/get_vehicles_response_dto.dart';

import '../../feature/profile/data/model/change_password_dto.dart';
import '../../feature/profile/data/model/change_password_request_model.dart';
import '../../feature/profile/data/model/profile_response_dto.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://flower.elevateegy.com/api/v1")
@singleton
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST(ApiEndPoints.applyEndPoint)
  @MultiPart()
  Future<HttpResponse<ApplyResponseDTO>> apply(
    // @Body() ApplyRequestModel request,
    @Part(name: 'country') String country,
    @Part(name: 'firstName') String firstName,
    @Part(name: 'lastName') String lastName,
    @Part(name: 'vehicleType') String vehicleType,
    @Part(name: 'vehicleNumber') String vehicleNumber,
    @Part(name: 'vehicleLicense', contentType: "image/jpeg")
    File vehicleLicense,
    @Part(name: 'NID') String NID,
    @Part(name: 'NIDImg', contentType: "image/jpeg") File NIDImg,
    @Part(name: 'email') String email,
    @Part(name: 'password') String password,
    @Part(name: 'rePassword') String rePassword,
    @Part(name: 'gender') String gender,
    @Part(name: 'phone') String phone,
  );
///////////////////++++++++++++++++/////////////////
///////////////////    Auth api    /////////////////
///////////////////++++++++++++++++/////////////////

  @POST(ApiEndPoints.signIn)
  Future<SignInResponseDTO> signIn(@Body() SignInRequest data);

  @POST(ApiEndPoints.forgetPassword)
  Future<ForgetResponsePasswordDto> forgetPassword(
    @Body() Map<String, dynamic> data,
  );

  @POST(ApiEndPoints.verifyResetCode)
  Future<VerifyEmailResponseDto> verifyEmail(@Body() Map<String, String> code);

  @PUT(ApiEndPoints.resetPassword)
  Future<ResetPasswordResponseDTO> resetPassword(
    @Body() Map<String, dynamic> data,
  );
  ///////////////////++++++++++++++++/////////////////
///////////////////    Order api    /////////////////
///////////////////++++++++++++++++/////////////////
  @GET(ApiEndPoints.allVehicleEndPoint)
  Future<HttpResponse<GetVehiclesResponseDTO>> getAllVehicles();

  @PUT("${ApiEndPoints.updateOrderStateEndPoint}/{orderId}")
  Future<void> updateOrderState(
      @Path("orderId") String orderId, @Body() Map<String, dynamic> data);

  @GET(ApiEndPoints.pendingOrdersEndPoint)
  Future<HttpResponse<PendingOrdersResponseDTO>> getPendingOrders();

///////////////////++++++++++++++++/////////////////
///////////////////    Profile api    /////////////////
///////////////////++++++++++++++++/////////////////
  @GET(ApiEndPoints.getProfileData)
  Future<ProfileResponseDTO> getProfileData();

  @PATCH(ApiEndPoints.changePassword)
  Future<ChangePasswordDTO> changePassword(
    @Body() ChangePasswordRequestModel data,
  );

  @PUT(ApiEndPoints.editProfile)
  Future<ProfileResponseDTO> editProfile(
    @Body() Map<String, dynamic> data,
      // @Part(name: 'image', contentType: "image/jpeg")
      // File license,
  );

  @PUT(ApiEndPoints.uploadProfilePhoto)
  @MultiPart()
  Future<String?> uploadPhoto(
    @Body() FormData formData,
  );

  @GET(ApiEndPoints.logout)
  Future<HttpResponse<void>> logout();

  @PUT(ApiEndPoints.editProfile)
  @MultiPart()
  Future<ProfileResponseDTO> editVehicle(
      @Body() Map<String, dynamic> data,
      @Part(name: 'name') String name,
      @Part(name: 'image', contentType: "image/jpeg") File image,
      );


}
