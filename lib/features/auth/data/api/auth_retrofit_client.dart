import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tracking_app/core/network/remote/api_constants.dart';

import '../models/apply_model.dart';
import '../models/post_auth.dart';
import '../models/vehicles_model.dart';
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
}
