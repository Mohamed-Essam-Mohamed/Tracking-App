import 'package:dio/dio.dart';
import 'package:tracking_app/features/auth/data/models/apply_model.dart';
import 'package:tracking_app/features/auth/domain/entities/apply_entity.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/domain/data_sources/remote/remote_auth_data_source.dart';
import 'package:tracking_app/features/auth/domain/entities/request/login/login_request_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/login_response_entity.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';
import '../models/response/login/login_response_dto.dart';
import '../../../../core/network/common/api_result.dart';
import '../../domain/entities/vehicles_entitiy.dart';
import '../data_sources/remote/remote_auth_data_source.dart';
import '../models/post_auth.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImp extends AuthRepository {
  RemoteAuthDataSource _dataSource;

  AuthRepositoryImp(this._dataSource);

  Future<Result<ApplyEntity>> apply(FormData formData) async {
    return await _dataSource.apply(formData);
  }
  Future<Result<VehiclesModelEntity>> getAllVehicles() async {
    return await _dataSource.getAllVehicles();
  }


  @override
  Future<Result<LoginResponseEntity?>> login(LoginRequestEntity? loginRequest) async {
    final result = await _dataSource.login(loginRequest!.toDto());

    if (result is SuccessResult<LoginResponseDto?>) {
      return SuccessResult(result.data?.toDomain());
    }
    else if (result is FailureResult<LoginResponseDto?>) {
      return FailureResult(result.exception);
    }
    return FailureResult(Exception("Unknown error occurred"));
  }
  // ex
  // @override
  // Future<Result<String>> function() async => await _dataSource.function();
}
