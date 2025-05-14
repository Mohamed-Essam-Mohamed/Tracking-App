import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/order_details/presentation/view_model/order_details_state.dart';
import 'package:tracking_app/features/order_details/presentation/widgets/OrderProgressIndicator.dart';
@injectable
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit()
      : super(const OrderDetailsStatusChangedInitial());


  OrderStatus currentStatus = OrderStatus.accepted;

  void advanceOrderStatus() {
    emit(OrderDetailsStatusChangedInitial());
    print('➡️ currentStatus before: $currentStatus');
    final nextIndex = currentStatus.index + 1;
    if (nextIndex < OrderStatus.values.length) {
      currentStatus = OrderStatus.values[nextIndex];
      print('➡️ nextIndex: $nextIndex');
      emit(OrderDetailsStatusChanged(currentStatus));
    } else {
      print('🔔 وصلت لآخر حالة: $currentStatus');
    }
  }
}
