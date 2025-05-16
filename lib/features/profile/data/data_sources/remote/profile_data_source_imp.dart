import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/remote/api_manager.dart';
import 'package:tracking_app/features/profile/data/api/profile_retrofit_client.dart';
import 'package:tracking_app/features/profile/domain/data_source/profile_data_source.dart';

@Injectable(as: ProfileDataSource)
class ProfileDataSourceImp implements ProfileDataSource {
  ProfileDataSourceImp(this._apiManager, this._profileRetrofitClient);
  final ApiManager _apiManager;

  final ProfileRetrofitClient _profileRetrofitClient;
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