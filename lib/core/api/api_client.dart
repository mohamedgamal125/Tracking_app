
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';



@RestApi(baseUrl: "https://flower.elevateegy.com/api/v1/drivers/")

@singleton
@injectable
abstract class ApiClient {

  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;


  // write here api calls
}