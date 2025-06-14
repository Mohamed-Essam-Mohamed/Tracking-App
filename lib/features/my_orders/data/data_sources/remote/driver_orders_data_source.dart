import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/my_orders/domain/entities/driver_orders_entities.dart';

abstract class DriverOrdersDataSource {
  Future<Result<DriverOrdersEntities>>getAllDriverOrders();
}
