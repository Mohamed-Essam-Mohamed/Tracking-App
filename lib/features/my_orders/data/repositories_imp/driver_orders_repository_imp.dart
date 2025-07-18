import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/domain/data_sources/remote/remote_auth_data_source.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:tracking_app/features/my_orders/data/data_sources/remote/driver_orders_data_source.dart';
import 'package:tracking_app/features/my_orders/domain/entities/driver_orders_entities.dart';
import 'package:tracking_app/features/my_orders/domain/repositories/driver_orders_repository.dart';

@Injectable(as: DriverOrdersRepository)
class DriverOrdersRepositoryImp implements DriverOrdersRepository {
  DriverOrdersRepositoryImp(this._dataSource);

  final DriverOrdersDataSource _dataSource;

  @override
  Future<Result<DriverOrdersEntities>> getAllDriverOrders() async =>
      await _dataSource.getAllDriverOrders();

// Future<Result<>>
// ex
// @override
// Future<Result<String>> function() async => await _dataSource.function();
}
