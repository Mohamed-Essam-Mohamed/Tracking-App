part of 'pending_order_cubit.dart';

extension OrderStateExtension on PendingOrderState {
  bool get isLoading => pendingOrdersStatus == Status.loading;
  bool get isSuccess => pendingOrdersStatus == Status.success;
  bool get isFailure => pendingOrdersStatus == Status.failure;
}

class PendingOrderState extends Equatable {
  const PendingOrderState({
    this.orders = const [],
    this.pendingOrdersStatus = Status.initial,
    this.errorMessage = '',
  });
  final List<OrderEntity> orders;
  final Status pendingOrdersStatus;
  final String errorMessage;

  // copyWith
  PendingOrderState copyWith({
    List<OrderEntity>? orders,
    Status? pendingOrdersStatus,
    String? errorMessage,
  }) {
    return PendingOrderState(
      orders: orders ?? this.orders,
      pendingOrdersStatus: pendingOrdersStatus ?? this.pendingOrdersStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        orders,
        pendingOrdersStatus,
        errorMessage,
      ];
}
