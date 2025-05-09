import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/data/models/request/forget_request_dto.dart';
import 'package:dio/dio.dart';
import 'package:tracking_app/features/auth/data/models/request/login/login_request_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/forget_response_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/login/login_response_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/reset_password_request.dart';
import 'package:tracking_app/features/auth/data/models/response/reset_password_response.dart';
import 'package:tracking_app/features/auth/data/models/response/verify_code_request.dart';
import 'package:tracking_app/features/auth/domain/entities/apply_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/vehicles_entitiy.dart';

abstract class RemoteAuthDataSource {
  Future<Result<LoginResponseDto?>> login(LoginRequestDto loginRequest);
  Future<Result<ForgetResponseDto?>> forgetPassword(ForgetRequestDto forgetRequest);
  Future<Result<String?>> verifyCode(VerifyCodeRequest verifyCode);
  Future<Result<ResetPasswordResponse?>> resetPassword(
      ResetPasswordRequest resetPasswordRequest);
  Future<Result<ApplyEntity>> apply(FormData formData);
  Future<Result<VehiclesModelEntity>> getAllVehicles();
}
