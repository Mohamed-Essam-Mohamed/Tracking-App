import 'package:dio/dio.dart';
import '../../../../core/network/common/api_result.dart';
import '../entities/apply_entity.dart';
import '../entities/vehicles_entitiy.dart';

abstract class AuthRepository {
  Future <Result<ApplyEntity>> apply( FormData formData);
  Future <Result<VehiclesModelEntity>> getAllVehicles();
  Future<Result<LoginResponseEntity?>> login(LoginRequestEntity? loginRequest);

}

