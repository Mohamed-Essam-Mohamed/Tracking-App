import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/profile/data/models/response/logout/logout_response_dto.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/profile/data/models/request/change_password/change_password_request_model.dart';
import 'package:tracking_app/features/profile/data/models/response/change_password/change_password_response_model.dart';

abstract class ProfileDataSource {
  Future<Result<LogoutResponseDto?>> logout();
  Future<Result<ChangePasswordResponseDto?>> changePassword(
      ChangePasswordRequestDto? passwordData);
}
