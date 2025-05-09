import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/data/models/response/verify_code_request.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class EmailVerificationUseCase {
  EmailVerificationUseCase(this._repository);
  final AuthRepository _repository;

  Future<Result<String?>> call(VerifyCodeRequest verifyCode) =>
      _repository.verifyCode(verifyCode);
}
