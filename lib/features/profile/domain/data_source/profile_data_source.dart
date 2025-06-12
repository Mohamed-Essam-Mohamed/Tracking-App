import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/profile/data/models/response/logout/logout_response_dto.dart';

abstract class ProfileDataSource {

  Future<Result<LogoutResponseDto?>> logout();
}
