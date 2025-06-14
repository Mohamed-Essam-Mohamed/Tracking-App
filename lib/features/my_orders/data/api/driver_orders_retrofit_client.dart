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
import 'package:tracking_app/features/my_orders/data/models/driver_orders_model.dart';

part 'driver_orders_retrofit_client.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class DriverOrdersRetrofitClient {
  @factoryMethod
  factory DriverOrdersRetrofitClient(Dio dio) = _DriverOrdersRetrofitClient ;

   @GET(ApiConstants.myOrders)
   Future<DriverOrdersDto> getAllDriverOrders(@Header('Authorization') String token);
}
