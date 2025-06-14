import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/vehicle_type_entity.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class GetVehicleTypeUseCase{
  const GetVehicleTypeUseCase(this._repository);
  final AuthRepository _repository;

  Future<Result<VehicleTypeEntity?>> call(String vehicleType ) async {
    final result = await _repository.getVehicleType(vehicleType);
    return result;
  }
}
