import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/driver_data_entity.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class GetDriverDataUseCase{
  const GetDriverDataUseCase(this._repository);
  final AuthRepository _repository;

  Future<Result<DriverDataEntity?>> call() async {
    final result = await _repository.getDriverData();
    return result;
  }
}
