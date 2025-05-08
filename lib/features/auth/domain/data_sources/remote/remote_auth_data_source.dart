import 'package:dio/dio.dart';
import 'package:tracking_app/features/auth/data/models/request/login/login_request_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/login/login_response_dto.dart';

import '../../../../../core/network/common/api_result.dart';
import '../../entities/apply_entity.dart';
import '../../entities/vehicles_entitiy.dart';

abstract class RemoteAuthDataSource {
  Future<Result<LoginResponseDto?>>login( LoginRequestDto loginRequest);
  Future<Result<ApplyEntity>>apply( FormData formData);
  Future<Result<VehiclesModelEntity>>getAllVehicles();
}
