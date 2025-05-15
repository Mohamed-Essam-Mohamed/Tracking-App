import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/home/presentation/view_model/order_details/order_details_state.dart';
import 'package:tracking_app/features/home/presentation/widgets/OrderProgressIndicator.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

@injectable
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(const OrderDetailsStatusChangedInitial());

  OrderStatus currentStatus = OrderStatus.accepted;
  String getButtonText(OrderStatus status) {
    switch (status) {
      case OrderStatus.accepted:
        return LocaleKeys.OrderDetails_ArrivedAtPickupPoint.tr();
      case OrderStatus.preparing:
        return LocaleKeys.OrderDetails_startDeliver.tr();
      case OrderStatus.onTheWay:
        return LocaleKeys.OrderDetails_arrivedToUser.tr();
      case OrderStatus.delivered:
        return LocaleKeys.OrderDetails_deliveredToUser.tr();
      case OrderStatus.completed:
        return LocaleKeys.OrderDetails_completed.tr();

    }
  }
  void advanceOrderStatus() {

    emit(const OrderDetailsStatusChangedInitial());
    print('➡️ currentStatus before: $currentStatus');
    final nextIndex = currentStatus.index + 1;
    if (nextIndex < OrderStatus.values.length) {
      currentStatus = OrderStatus.values[nextIndex];
      emit(OrderDetailsStatusChanged(currentStatus));
      print('➡️ nextIndex: $nextIndex');
      emit(OrderDetailsStatusChanged(currentStatus));
    } else {
      print('🔔 وصلت لآخر حالة: $currentStatus');
    }
  }
}
