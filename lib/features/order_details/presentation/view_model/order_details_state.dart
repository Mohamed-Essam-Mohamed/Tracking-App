import 'package:equatable/equatable.dart';
import 'package:tracking_app/features/order_details/order_model.dart';
import 'package:tracking_app/features/order_details/presentation/widgets/OrderProgressIndicator.dart';

sealed class OrderDetailsState extends Equatable {
  const OrderDetailsState();
  @override
  List<Object?> get props => [];
}


class OrderDetailsStatusChangedInitial extends OrderDetailsState {
  const OrderDetailsStatusChangedInitial();
}
class OrderDetailsStatusChanged extends OrderDetailsState {
  const OrderDetailsStatusChanged(this.status);
  final OrderStatus status;
}

