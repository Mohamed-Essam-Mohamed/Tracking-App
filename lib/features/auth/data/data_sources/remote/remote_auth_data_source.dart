import 'package:dio/dio.dart';
import 'package:tracking_app/features/auth/data/models/apply_model.dart';

import '../../../../../core/network/common/api_result.dart';
import '../../../domain/entities/apply_entity.dart';
import '../../../domain/entities/vehicles_entitiy.dart';
import '../../models/post_auth.dart';

abstract class RemoteAuthDataSource {
  Future<Result<ApplyEntity>>apply( FormData formData);
  Future<Result<VehiclesModelEntity>>getAllVehicles();
}
