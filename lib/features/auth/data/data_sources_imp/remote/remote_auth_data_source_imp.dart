import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/remote/api_manager.dart';
import 'package:tracking_app/features/auth/data/api/auth_retrofit_client.dart';
import 'package:tracking_app/features/auth/domain/data_sources/remote/remote_auth_data_source.dart';

@Injectable(as: RemoteAuthDataSource)
class RemoteAuthDataSourceImp extends RemoteAuthDataSource {
  // we handle errors by using function execute
  final ApiManager _apiManager;

  final AuthRetrofitClient _apiService;

  RemoteAuthDataSourceImp(this._apiManager, this._apiService);

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
}
