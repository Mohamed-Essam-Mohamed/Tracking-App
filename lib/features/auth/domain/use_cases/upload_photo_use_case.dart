
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';
import '../../../../core/network/common/api_result.dart';
@injectable
class UploadPhotoUseCase {
  final AuthRepository authRepo;

  UploadPhotoUseCase(this.authRepo);
  Future<Result<String>> uploadPhoto(File request) async
  {

    return await authRepo.uploadPhoto(request);
  }



}