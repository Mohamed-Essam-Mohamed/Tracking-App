import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepository authRepository;
  ForgetPasswordUseCase(this.authRepository);
}
