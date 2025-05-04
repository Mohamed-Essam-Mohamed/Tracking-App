import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class EmailVerificationUseCase {
  final AuthRepository _repository;
  EmailVerificationUseCase(this._repository);
}
