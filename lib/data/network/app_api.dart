import 'package:dio/dio.dart';
import 'package:flutter_udemy/app/constant.dart';
import 'package:flutter_udemy/data/responses/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticationResponse> login();

}
