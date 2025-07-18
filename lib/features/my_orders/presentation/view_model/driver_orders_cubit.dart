import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/my_orders/domain/entities/driver_orders_entities.dart';
import 'package:tracking_app/features/my_orders/domain/use_cases/driver_orders_use_cases.dart';
import 'package:tracking_app/features/my_orders/presentation/view_model/driver_orders_state.dart';

@injectable
class DriverOrdersCubit extends Cubit<DriverOrdersState> {
  DriverOrdersCubit(this.useCase) : super(DriverOrdersInitial());

  final DriverOrdersUseCases useCase;

  Future<void> getAllDriverOrders() async {
    emit(DriverOrdersLoading());

    try {
      final response = await useCase.getAllDriverOrders();

      if (response is SuccessResult<DriverOrdersEntities>) {

        final allOrders = response.data.orders ?? [];
        final filteredOrders = allOrders.where((order) {
          final state = order.order?.state?.toLowerCase();
          return state == 'completed' || state == 'canceled';
        }).toList();
        final completedCount = allOrders
            .where((order) => order.order?.state?.toLowerCase() == 'completed')
            .length;

        final cancelledCount = allOrders
            .where((order) => order.order?.state?.toLowerCase() == 'canceled')
            .length;

        emit(
          DriverOrdersSuccess(
            driverOrdersEntities: response.data,
            filteredOrders: filteredOrders,
            completedCount: completedCount,
            cancelledCount: cancelledCount,
          ),
        );
      }
    } catch (e) {
      emit(DriverOrdersError('حدث خطأ أثناء جلب البيانات: $e'));
    }
  }
}
