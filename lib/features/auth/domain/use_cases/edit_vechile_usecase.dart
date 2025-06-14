import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/domain/entities/apply_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/edit_vechile_entite.dart';
import 'package:tracking_app/features/auth/domain/entities/vehicles_entitiy.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class EditVechileUsecase {
  EditVechileUsecase(this.authRepository);
  AuthRepository authRepository;
  Future<Result<EditVechileEntite>> apply(FormData formData) {
    return authRepository.editVeicle(formData);
  }

  Future<Result<VehiclesModelEntity>> getAllVehicles() {
    return authRepository.getAllVehicles();
  }
}
