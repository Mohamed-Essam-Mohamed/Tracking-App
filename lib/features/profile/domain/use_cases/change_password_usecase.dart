import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/profile/domain/entities/change_password/change_password__request_entity.dart';
import 'package:tracking_app/features/profile/domain/entities/change_password/change_password__response_entity.dart';
import 'package:tracking_app/features/profile/domain/repositories/profile_repository.dart';


@injectable
class ChangePasswordUseCase {
  ChangePasswordUseCase(this._profileRepository);
  final ProfileRepository _profileRepository;
  Future<Result<ChangePasswordResponseEntity?>> call(ChangePasswordRequestEntity? passwordData) async {
    final result = await _profileRepository.changePassword(passwordData);

    return result;

  }}