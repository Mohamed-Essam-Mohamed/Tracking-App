import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/home/domain/entities/item_order_details_entity.dart';

abstract class HomeRepository {
  Future<Result<ItemOrderDetailsEntity>> getAllPendingOrders();
}
