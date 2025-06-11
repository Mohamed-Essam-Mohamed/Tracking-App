import 'dart:io';

import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/core/network/remote/api_manager.dart';
import 'package:tracking_app/core/utils/app_shared_preference.dart';
import 'package:tracking_app/features/auth/data/api/auth_retrofit_client.dart';
import 'package:tracking_app/features/auth/data/api/upload_photo_api_service.dart';
import 'package:tracking_app/features/auth/data/models/apply_model.dart';
import 'package:tracking_app/features/auth/data/models/request/edit_profile_request.dart';
import 'package:tracking_app/features/auth/data/models/vehicles_model.dart';
import 'package:tracking_app/features/auth/domain/entities/apply_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/vehicles_entitiy.dart';

import 'package:tracking_app/features/auth/data/models/request/forget_request_dto.dart';
import 'package:tracking_app/features/auth/data/models/request/login/login_request_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/forget_response_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/login/login_response_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/reset_password_request.dart';
import 'package:tracking_app/features/auth/data/models/response/reset_password_response.dart';
import 'package:tracking_app/features/auth/data/models/response/verify_code_request.dart';
import 'package:tracking_app/features/auth/domain/data_sources/remote/remote_auth_data_source.dart';

@Injectable(as: RemoteAuthDataSource)
class RemoteAuthDataSourceImp extends RemoteAuthDataSource {
  RemoteAuthDataSourceImp(this._apiManager, this._apiService, this.authApiService);
  final ApiManager _apiManager;
  final UploadPhotoApiService authApiService;

  final AuthRetrofitClient _apiService;

  @override
  Future<Result<ApplyEntity>> apply(FormData formData) async {
    final result = await _apiManager.execute<ApplyModelDto>(() async {
      final response = await _apiService.apply(formData);
      return response;
    });

    switch (result) {
      case SuccessResult<ApplyModelDto>():
        return SuccessResult<ApplyEntity>(result.data.toEntity());
      case FailureResult<ApplyModelDto>():
        return FailureResult<ApplyEntity>(result.exception);
    }
  }

  @override
  Future<Result<VehiclesModelEntity>> getAllVehicles() async {
    final result = await _apiManager.execute<VehiclesModelDto>(() async {
      final response = await _apiService.getAllVehicles();
      return response;
    });
    switch (result) {
      case SuccessResult<VehiclesModelDto>():
        return SuccessResult<VehiclesModelEntity>(result.data.toEntity());
      case FailureResult<VehiclesModelDto>():
        return FailureResult<VehiclesModelEntity>(result.exception);
    }
  }

  @override
  Future<Result<LoginResponseDto?>> login(LoginRequestDto loginRequest) async {
    final response = await _apiManager.execute<LoginResponseDto?>(
      () async {
        return await _apiService.login(loginRequest);
      },
    );

    return response;
  }

  @override
  Future<Result<ForgetResponseDto?>> forgetPassword(
      ForgetRequestDto forgetRequest) async {
    final response = await _apiManager.execute<ForgetResponseDto?>(() async {
      return _apiService.forgetPassword(forgetRequest);
    });
    return response;
  }

  @override
  Future<Result<ResetPasswordResponse?>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    final response = await _apiManager.execute<ResetPasswordResponse?>(() {
      return _apiService.resetPassword(resetPasswordRequest);
    });
    return response;
  }

  @override
  Future<Result<String?>> verifyCode(VerifyCodeRequest verifyCode) async {
    final response = await _apiManager.execute<String?>(() async {
      return _apiService.verifyResetCode(verifyCode);
    });

    return response;
  }
  @override
  Future<Result<String>> editProfile(EditProfileRequest request) async {
    return await  _apiManager.execute<String>(() async {
      final token = await SharedPreferencesUtils.getString("token");
      if (token == null) {
        throw Exception("Token is not available");
      }

      final response = await  _apiService.editProfile(" Bearer ${token}",request);
      print(SharedPreferencesUtils.getString("token").toString());
      return response.message!;
    });
  }

  @override
  Future<Result<String>> uploadPhoto(File request) async{
    return await _apiManager.execute<String>(() async {
      final token = await  SharedPreferencesUtils.getString("token");
      if (token == null) {
        throw Exception("Token is not available");
      }

      final response = await authApiService.uploadPhoto(request);
      print(SharedPreferencesUtils.getString("token").toString());
      print("llllllllllllllllllllllllllllllllllllllllllllllll");
      print(response.toString());
      return response.toString();

    });
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

