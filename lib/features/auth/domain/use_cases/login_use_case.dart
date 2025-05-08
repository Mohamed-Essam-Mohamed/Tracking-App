import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/network/common/api_result.dart';
import '../entities/request/login/login_request_entity.dart';
import '../entities/response/login/login_response_entity.dart';

@injectable
class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<Result<LoginResponseEntity?>> call(LoginRequestEntity? loginRequest) async {
    final result = await _repository.login(loginRequest);

    return result;

  }}

