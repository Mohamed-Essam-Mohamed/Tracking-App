import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/profile/domain/entities/profile_data/profile_data_entity.dart';
import 'package:tracking_app/features/profile/domain/repositories/profile_repository.dart';

@injectable
class GetProfileDataUseCase {
  const GetProfileDataUseCase(this._profileRepository);
  final ProfileRepository _profileRepository;

  Future<Result<ProfileDataEntity>> call() async {
    final result = await _profileRepository.getProfileData();
    return result;
  }
}
