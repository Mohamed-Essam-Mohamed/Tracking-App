import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/home/domain/data_sources/remote/home_remote_data_source.dart';
import 'package:tracking_app/features/home/domain/entities/item_order_details_entity.dart';
import 'package:tracking_app/features/home/domain/repositories/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository {
  const HomeRepositoryImp(this._remoteDataSource);
  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<Result<ItemOrderDetailsEntity>> getAllPendingOrders() =>
      _remoteDataSource.getAllPendingOrders();
}
