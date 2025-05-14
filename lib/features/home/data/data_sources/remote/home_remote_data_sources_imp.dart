import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/core/network/remote/api_manager.dart';
import 'package:tracking_app/features/home/data/api/home_retrofit_client.dart';
import 'package:tracking_app/features/home/data/models/item_order_details_dto.dart';
import 'package:tracking_app/features/home/domain/data_sources/remote/home_remote_data_source.dart';
import 'package:tracking_app/features/home/domain/entities/item_order_details_entity.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourcesImp extends HomeRemoteDataSource {
  HomeRemoteDataSourcesImp(this._apiManager, this._apiService);
  final ApiManager _apiManager;
  final HomeRetrofitClient _apiService;
  @override
  Future<Result<ItemOrderDetailsEntity>> getAllPendingOrders() async {
    final result = await _apiManager.execute<ItemOrderDetailsDto>(() async {
      final String token =
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2NzhhNTlmYTNjMzc5NzQ5Mjc0N2M4ZDQiLCJpYXQiOjE3MzcxMjAyNTB9.f-A1rvElymvDhEQM9bjqGl56O4c5Z8mhh7MkevnpqVQ';
      final response = await _apiService.getAllPendingOrders(token);
      return response;
    });
    switch (result) {
      case SuccessResult<ItemOrderDetailsDto>():
        return SuccessResult<ItemOrderDetailsEntity>(result.data.toEntity());
      case FailureResult<ItemOrderDetailsDto>():
        return FailureResult<ItemOrderDetailsEntity>(result.exception);
    }
  }
}
