import '../../../../core/network/common/api_result.dart';
import '../entities/apply_entity.dart';
import '../entities/request/login/login_request_entity.dart';
import '../entities/response/login/login_response_entity.dart';
import '../entities/vehicles_entitiy.dart';

abstract class AuthRepository {
  Future <Result<ApplyEntity>> apply( FormData formData);
  Future <Result<VehiclesModelEntity>> getAllVehicles();
  Future<Result<LoginResponseEntity?>> login(LoginRequestEntity? loginRequest);
  Future<Result<ForgetPasswordEntity?>>forgetPassword(ForgetRequestDto forgetrequest);
  Future<Result<String?>>verifyCode(VerifyCodeRequest verifyCode);
  Future<Result<ResetPasswordEntity?>>resetPassword(ResetPasswordRequest resetPassordRequest);
}

