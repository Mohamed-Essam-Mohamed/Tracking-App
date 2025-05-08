import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/auth/data/models/apply_model.dart';
import 'package:tracking_app/features/auth/domain/entities/apply_entity.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';

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

}
