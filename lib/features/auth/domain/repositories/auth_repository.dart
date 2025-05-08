import 'package:tracking_app/features/auth/data/models/request/forget_request_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/reset_password_request.dart';
import 'package:tracking_app/features/auth/data/models/response/verify_code_request.dart';
import 'package:tracking_app/features/auth/domain/entities/forget_password_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/reset_password_entity.dart';

import '../../../../core/network/common/api_result.dart';
import '../entities/request/login/login_request_entity.dart';
import '../entities/response/login/login_response_entity.dart';

abstract class AuthRepository {
  Future<Result<LoginResponseEntity?>> login(LoginRequestEntity? loginRequest);
  Future<Result<ForgetPasswordEntity?>>forgetPassword(ForgetRequestDto forgetrequest);
  Future<Result<String?>>verifyCode(VerifyCodeRequest verifyCode);
  Future<Result<ResetPasswordEntity?>>resetPassword(ResetPasswordRequest resetPassordRequest);
}
