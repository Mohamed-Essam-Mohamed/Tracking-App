import 'package:tracking_app/features/my_orders/domain/entities/driver_orders_entities.dart';

abstract class DriverOrdersState {}

class DriverOrdersInitial extends DriverOrdersState {}

class DriverOrdersLoading extends DriverOrdersState {}

class DriverOrdersSuccess extends DriverOrdersState {
  final DriverOrdersEntities driverOrdersEntities;

  final List<OrdersEntities> filteredOrders;
  final int completedCount;
  final int cancelledCount;

  DriverOrdersSuccess({
    required this.driverOrdersEntities,
    required this.completedCount,
    required this.cancelledCount,
    required this.filteredOrders

  });
}

class DriverOrdersError extends DriverOrdersState {
  final String message;
  DriverOrdersError(this.message);
}
