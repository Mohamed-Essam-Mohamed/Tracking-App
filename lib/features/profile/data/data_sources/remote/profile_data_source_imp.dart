import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/core/network/remote/api_manager.dart';
import 'package:tracking_app/features/profile/data/api/profile_retrofit_client.dart';
import 'package:tracking_app/features/profile/data/models/response/logout/logout_response_dto.dart';
import 'package:tracking_app/features/profile/data/models/request/change_password/change_password_request_model.dart';
import 'package:tracking_app/features/profile/data/models/response/change_password/change_password_response_model.dart';
import 'package:tracking_app/features/profile/domain/data_source/profile_data_source.dart';

@Injectable(as: ProfileDataSource)
class ProfileDataSourceImp implements ProfileDataSource {
  ProfileDataSourceImp(this._apiManager, this._profileRetrofitClient);

  final ApiManager _apiManager;
  final ProfileRetrofitClient _profileRetrofitClient;

  @override
  Future<Result<LogoutResponseDto?>> logout() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final fullToken = 'Bearer $token';
    final response = await _apiManager.execute<LogoutResponseDto?>(
      () async {
        return await _profileRetrofitClient.logout(fullToken);
      },
    );

    return response;
  }

  @override
  Future<Result<ChangePasswordResponseDto?>> changePassword(
      ChangePasswordRequestDto? passwordData) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final fullToken = 'Bearer $token';
    final response = await _apiManager.execute<ChangePasswordResponseDto?>(
      () async {
        return await _profileRetrofitClient.changePassword(passwordData, fullToken);
      },
    );

    return response;
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