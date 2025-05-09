import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/data/models/response/reset_password_request.dart';
import 'package:tracking_app/features/auth/domain/entities/reset_password_entity.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class ResetPasswordUseCase {
  const ResetPasswordUseCase(this._repository);
  final AuthRepository _repository;
  Future<Result<ResetPasswordEntity?>> call(ResetPasswordRequest resetPasswordRequest) =>
      _repository.resetPassword(resetPasswordRequest);
}
