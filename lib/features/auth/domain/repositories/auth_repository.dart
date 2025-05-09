import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/data/models/request/forget_request_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/reset_password_request.dart';
import 'package:tracking_app/features/auth/data/models/response/verify_code_request.dart';
import 'package:tracking_app/features/auth/domain/entities/apply_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/forget_password_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/request/login/login_request_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/reset_password_entity.dart';

import 'package:dio/dio.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/login_response_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/vehicles_entitiy.dart';

abstract class AuthRepository {
  Future<Result<ApplyEntity>> apply(FormData formData);
  Future<Result<VehiclesModelEntity>> getAllVehicles();
  Future<Result<LoginResponseEntity?>> login(LoginRequestEntity? loginRequest);
  Future<Result<ForgetPasswordEntity?>> forgetPassword(ForgetRequestDto forgetRequest);
  Future<Result<String?>> verifyCode(VerifyCodeRequest verifyCode);
  Future<Result<ResetPasswordEntity?>> resetPassword(
      ResetPasswordRequest resetPasswordRequest);
}
