import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import '../entities/apply_entity.dart';
import '../entities/vehicles_entitiy.dart';
import '../repositories/auth_repository.dart';
@injectable
class ApplyUseCases {
  AuthRepository authRepository;
  ApplyUseCases( this.authRepository);
  Future <Result<ApplyEntity>>apply( FormData formData) {
    return authRepository.apply(formData);
  }

  Future <Result<VehiclesModelEntity>>getAllVehicles( ) {
    return authRepository.getAllVehicles();
  }

}