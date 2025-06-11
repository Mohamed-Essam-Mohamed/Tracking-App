
import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/auth/data/models/request/edit_profile_request.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';
import '../../../../core/network/common/api_result.dart';
@injectable
class EditProfileUseCase {
  final AuthRepository authRepo;

  EditProfileUseCase(this.authRepo);

  Future<Result<String>> editProfile(EditProfileRequest request) async
  {
    return await authRepo.editProfile(request);
  }



}