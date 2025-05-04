import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);
}
