import '../../../../core/network/common/api_result.dart';
import '../entities/request/login/login_request_entity.dart';
import '../entities/response/login/login_response_entity.dart';

abstract class AuthRepository {
  Future<Result<LoginResponseEntity?>> login(LoginRequestEntity? loginRequest);

}
