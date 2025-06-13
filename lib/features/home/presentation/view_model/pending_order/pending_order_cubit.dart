import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/enum/status.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/home/domain/entities/item_order_details_entity.dart';
import 'package:tracking_app/features/home/domain/use_cases/get_all_pending_order_use_case.dart';

part 'pending_order_state.dart';

@injectable
class PendingOrderCubit extends Cubit<PendingOrderState> {
  PendingOrderCubit(this._getAllPendingOrderUseCase) : super(const PendingOrderState());
  final GetAllPendingOrderUseCase _getAllPendingOrderUseCase;

  Future<void> getAllPendingOrder() async {
    emit(state.copyWith(pendingOrdersStatus: Status.loading));
    final result = await _getAllPendingOrderUseCase.call();

    switch (result) {
      case SuccessResult<ItemOrderDetailsEntity>():
        emit(state.copyWith(
          pendingOrdersStatus: Status.success,
          orders: result.data.orders,
        ));
      case FailureResult<ItemOrderDetailsEntity>():
        emit(state.copyWith(
          pendingOrdersStatus: Status.failure,
          errorMessage: result.exception.toString(),
        ));
    }
  }

  @override
  void onChange(Change<PendingOrderState> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
