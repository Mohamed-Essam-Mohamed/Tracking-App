import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/data/models/request/forget_request_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/forget_response_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/login/driver_data_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/login/login_response_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/login/vehicle_type_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/reset_password_request.dart';
import 'package:tracking_app/features/auth/data/models/response/verify_code_request.dart';
import 'package:tracking_app/features/auth/domain/data_sources/remote/remote_auth_data_source.dart';
import 'package:tracking_app/features/auth/domain/entities/forget_password_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/apply_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/request/login/login_request_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/reset_password_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/driver_data_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/login_response_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/vehicle_type_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/vehicles_entitiy.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  AuthRepositoryImp(this._dataSource);
  final RemoteAuthDataSource _dataSource;
  @override
  Future<Result<ApplyEntity>> apply(FormData formData) async {
    return await _dataSource.apply(formData);
  }

  @override
  Future<Result<VehiclesModelEntity>> getAllVehicles() async {
    return await _dataSource.getAllVehicles();
  }

  @override
  Future<Result<LoginResponseEntity?>> login(LoginRequestEntity? loginRequest) async {
    final result = await _dataSource.login(loginRequest!.toDto());

    if (result is SuccessResult<LoginResponseDto?>) {
      return SuccessResult(result.data?.toDomain());
    } else if (result is FailureResult<LoginResponseDto?>) {
      return FailureResult(result.exception);
    }
    return FailureResult(Exception('Unknown error occurred'));
  }





  @override
  Future<Result<ForgetPasswordEntity?>> forgetPassword(
      ForgetRequestDto forgetRequest) async {
    final result = await _dataSource.forgetPassword(forgetRequest);
    switch (result) {
      case SuccessResult<ForgetResponseDto?>():
        return SuccessResult(result.data?.toDomain());
      case FailureResult<ForgetResponseDto?>():
        return FailureResult(result.exception);
    }
    // Future<Result<>>
    // ex
    // @override
    // Future<Result<String>> function() async => await _dataSource.function();
  }

  @override
  Future<Result<String?>> verifyCode(VerifyCodeRequest verifyCode) async {
    final result = await _dataSource.verifyCode(verifyCode);
    return result;
  }

  @override
  Future<Result<ResetPasswordEntity?>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    final result = await _dataSource.resetPassword(resetPasswordRequest);
    switch (result) {
      case SuccessResult():
        return SuccessResult(result.data!.toDomain());
      case FailureResult():
        return FailureResult(result.exception);
    }
  }

  @override
  Future<Result<DriverDataEntity?>> getDriverData() async {
    final result = await _dataSource.getDriverData();
    if (result is SuccessResult<DriverDataDto?>) {
      return SuccessResult(result.data?.toDomain());
    } else if (result is FailureResult<DriverDataDto?>) {
      return FailureResult(result.exception);
    }
    return FailureResult(Exception('Unknown error occurred'));
  }

  @override
  Future<Result<VehicleTypeEntity?>> getVehicleType(String vehicleType) async{
    final result = await _dataSource.getVehicleType(vehicleType);

    if (result is SuccessResult<VehicleTypeDto?>) {
      return SuccessResult(result.data?.toDomain());
    } else if (result is FailureResult<VehicleTypeDto?>) {
      return FailureResult(result.exception);
    }
    return FailureResult(Exception('Unknown error occurred'));
  }




}
