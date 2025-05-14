import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/home/domain/entities/item_order_details_entity.dart';
import 'package:tracking_app/features/home/domain/repositories/home_repository.dart';

@injectable
class GetAllPendingOrderUseCase {
  const GetAllPendingOrderUseCase(this._repository);
  final HomeRepository _repository;

  Future<Result<ItemOrderDetailsEntity>> call() => _repository.getAllPendingOrders();
}
