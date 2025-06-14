
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/core/network/remote/api_manager.dart';
import 'package:tracking_app/features/my_orders/data/api/driver_orders_retrofit_client.dart';
import 'package:tracking_app/features/my_orders/data/data_sources/remote/driver_orders_data_source.dart';
import 'package:tracking_app/features/my_orders/data/models/driver_orders_model.dart';
import 'package:tracking_app/features/my_orders/domain/entities/driver_orders_entities.dart';

@Injectable(as: DriverOrdersDataSource)
class DriverOrdersDataSourceImp extends DriverOrdersDataSource {
  DriverOrdersDataSourceImp(this._apiManager, this._apiService);
  final ApiManager _apiManager;
  final DriverOrdersRetrofitClient _apiService;

  @override
  Future<Result<DriverOrdersEntities>> getAllDriverOrders() async{
    final result = await _apiManager.execute<DriverOrdersDto>(() async {
      final String token =
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2NzhhNTlmYTNjMzc5NzQ5Mjc0N2M4ZDQiLCJpYXQiOjE3MzcxMjAyNTB9.f-A1rvElymvDhEQM9bjqGl56O4c5Z8mhh7MkevnpqVQ';
      final response = await _apiService.getAllDriverOrders(token);
      return response;
    });

    switch (result) {
      case SuccessResult<DriverOrdersDto>():
        return SuccessResult<DriverOrdersEntities>(result.data.toEntity());
      case FailureResult<DriverOrdersDto>():
        return FailureResult<DriverOrdersEntities>(result.exception);
    }
  }


}



  // ex
  // @override
  // Future<Result<ModelResponseEntity>> function() async {
  //   final result = await _apiManager.execute<ModelResponseDto>(() async {
  //     final response =
  //         await _apiService.function(ModelRequestDto());
  //     return response;
  //   });
  //   switch (result) {
  //     case SuccessResult<ModelResponseDto>():
  //       return SuccessResult<ModelResponseEntity>(result.data.toEntity());
  //     case FailureResult<ModelResponseDto>():
  //       return FailureResult<ModelResponseEntity>(result.exception);
  //   }
  // }

