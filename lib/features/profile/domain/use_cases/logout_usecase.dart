
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/profile/domain/entities/logout/logout_response_entity.dart';
import 'package:tracking_app/features/profile/domain/repositories/profile_repository.dart';

@injectable
class LogoutUseCase {
  const LogoutUseCase(this._profileRepository);
  final ProfileRepository _profileRepository;

  Future<Result<LogoutResponseEntity?>> call() async {
    final result = await _profileRepository.logout();
    return result;
  }
}