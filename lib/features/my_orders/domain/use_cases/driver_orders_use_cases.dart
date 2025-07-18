
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/my_orders/domain/entities/driver_orders_entities.dart';
import 'package:tracking_app/features/my_orders/domain/repositories/driver_orders_repository.dart';

@injectable
class DriverOrdersUseCases {
  DriverOrdersUseCases(this.driverOrdersRepository);
  DriverOrdersRepository driverOrdersRepository;

Future <Result<DriverOrdersEntities>?>getAllDriverOrders()async{
  final response = await driverOrdersRepository.getAllDriverOrders();
  return response;
}




}
