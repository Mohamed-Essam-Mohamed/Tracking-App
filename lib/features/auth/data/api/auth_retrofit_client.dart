import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tracking_app/core/network/remote/api_constants.dart';
part 'auth_retrofit_client.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthRetrofitClient {
  @factoryMethod
  factory AuthRetrofitClient(Dio dio) = _AuthRetrofitClient;
  // ex :
  //  @POST(ApiConstants.nameEndpoint)
  // Future<ModelResponseDto> function(
  //     @Body() ModelRequestDto modelRequestDto);
}
