import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tracking_app/core/network/remote/api_constants.dart';
import 'package:tracking_app/features/auth/data/models/apply_model.dart';
import 'package:tracking_app/features/auth/data/models/request/forget_request_dto.dart';
import 'package:tracking_app/features/auth/data/models/request/login/login_request_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/forget_response_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/login/login_response_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/reset_password_request.dart';
import 'package:tracking_app/features/auth/data/models/response/reset_password_response.dart';
import 'package:tracking_app/features/auth/data/models/response/verify_code_request.dart';
import 'package:tracking_app/features/auth/data/models/vehicles_model.dart';

part 'auth_retrofit_client.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthRetrofitClient {
  @factoryMethod
  factory AuthRetrofitClient(Dio dio) = _AuthRetrofitClient;
  @POST(ApiConstants.apply)
  Future<ApplyModelDto> apply(@Body() FormData formData);
  @GET(ApiConstants.vehicles)
  Future<VehiclesModelDto> getAllVehicles();

  @POST(ApiConstants.loginRoute)
  Future<LoginResponseDto> login(@Body() LoginRequestDto loginRequest);

  @POST(ApiConstants.forgetPassword)
  Future<ForgetResponseDto> forgetPassword(@Body() ForgetRequestDto forgetRequest);

  @POST(ApiConstants.verifyResetCode)
  Future<String?> verifyResetCode(@Body() VerifyCodeRequest verifycodeRequest);

  @PUT(ApiConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
      @Body() ResetPasswordRequest resetPasswordRequest);
  // ex :
  //  @POST(ApiConstants.nameEndpoint)
  // Future<ModelResponseDto> function(
  //     @Body() ModelRequestDto modelRequestDto);
}
