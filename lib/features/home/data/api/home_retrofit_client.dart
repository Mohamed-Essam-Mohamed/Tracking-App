import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/remote/api_constants.dart';
import 'package:tracking_app/features/home/data/models/item_order_details_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'home_retrofit_client.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeRetrofitClient {
  @factoryMethod
  factory HomeRetrofitClient(Dio dio) = _HomeRetrofitClient;

  @GET(ApiConstants.pendingOrders)
  Future<ItemOrderDetailsDto> getAllPendingOrders(@Header('Authorization') String token);
}
