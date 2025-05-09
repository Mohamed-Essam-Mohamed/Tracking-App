import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/data/models/request/forget_request_dto.dart';
import 'package:tracking_app/features/auth/domain/entities/forget_password_entity.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class ForgetPasswordUseCase {
  const ForgetPasswordUseCase(this._repository);
  final AuthRepository _repository;
  Future<Result<ForgetPasswordEntity?>> call(ForgetRequestDto? forgetRequest) async {
    final result = await _repository.forgetPassword(forgetRequest!);
    return result;
  }
}
