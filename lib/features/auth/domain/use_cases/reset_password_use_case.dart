import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepository _repository;
  ResetPasswordUseCase(this._repository);
}
