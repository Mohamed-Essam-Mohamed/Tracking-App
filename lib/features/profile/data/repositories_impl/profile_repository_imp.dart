import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/profile/data/models/response/logout/logout_response_dto.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/profile/data/models/response/change_password/change_password_response_model.dart';
import 'package:tracking_app/features/profile/domain/data_source/profile_data_source.dart';
import 'package:tracking_app/features/profile/domain/entities/logout/logout_response_entity.dart';
import 'package:tracking_app/features/profile/domain/entities/change_password/change_password__request_entity.dart';
import 'package:tracking_app/features/profile/domain/entities/change_password/change_password__response_entity.dart';
import 'package:tracking_app/features/profile/domain/repositories/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImp implements ProfileRepository {
  ProfileRepositoryImp(this._profileDataSource);
  final ProfileDataSource _profileDataSource;

  @override
  Future<Result<LogoutResponseEntity?>> logout() async {
    final result = await _profileDataSource.logout();

    if (result is SuccessResult<LogoutResponseDto?>) {
      return SuccessResult(result.data?.toDomain());
    } else if (result is FailureResult<LogoutResponseDto?>) {
      return FailureResult(result.exception);
    }
    return FailureResult(Exception('Unknown error occurred'));
  }
}

  final ProfileDataSource _profileDataSource;

  @override
  Future<Result<ChangePasswordResponseEntity?>> changePassword(
      ChangePasswordRequestEntity? passwordData) async {
    final result = await _profileDataSource.changePassword(
        passwordData!.toDto());

    if (result is SuccessResult<ChangePasswordResponseDto?>) {
      return SuccessResult(result.data?.toDomain());
    }
    else if (result is FailureResult<ChangePasswordResponseDto?>) {
      return FailureResult(result.exception);
    }
    return FailureResult(Exception("Unknown error occurred"));
  }
}



// Future<Result<>>
    // ex
    // @override
    // Future<Result<String>> function() async => await _dataSource.function();