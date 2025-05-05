import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tracking_app/core/utils/end_points.dart';

import '../../feature/auth/data/model/forget_response_password_dto.dart';
import '../../feature/auth/data/model/reset_password_dto.dart';
import '../../feature/auth/data/model/sign_in_response_dto.dart';
import '../../feature/auth/data/model/verify_email_response_dto.dart';
import '../../feature/auth/domain/entity/sign_in_request.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://flower.elevateegy.com/api/v1/drivers/")

@singleton
@injectable
abstract class ApiClient {

  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

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
}