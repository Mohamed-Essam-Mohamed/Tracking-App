import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:tracking_app/core/network/remote/api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:tracking_app/features/profile/data/models/response/logout/logout_response_dto.dart';
import 'package:retrofit/error_logger.dart';
import 'package:tracking_app/features/profile/data/models/request/change_password/change_password_request_model.dart';
import 'package:tracking_app/features/profile/data/models/response/change_password/change_password_response_model.dart';

part 'profile_retrofit_client.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProfileRetrofitClient {
  @factoryMethod
  factory ProfileRetrofitClient(Dio dio) = _ProfileRetrofitClient;

  @GET(ApiConstants.vehicles)
  Future<LogoutResponseDto> logout(@Header('Authorization') String? token);
  @PATCH(ApiConstants.changePasswordRoute)
  Future<ChangePasswordResponseDto?> changePassword(
      @Body() ChangePasswordRequestDto? changePasswordRequest,
      @Header('Authorization') String? token);

  // ex :
  //  @POST(ApiConstants.nameEndpoint)
  // Future<ModelResponseDto> function(
  //     @Body() ModelRequestDto modelRequestDto);
}
