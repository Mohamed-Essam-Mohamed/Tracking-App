import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/profile/domain/entities/logout/logout_response_entity.dart';

abstract class ProfileRepository {
  Future<Result<LogoutResponseEntity?>> logout();

}
