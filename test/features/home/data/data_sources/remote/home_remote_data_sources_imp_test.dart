import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/core/network/remote/api_manager.dart';
import 'package:tracking_app/features/home/data/api/home_retrofit_client.dart';
import 'package:tracking_app/features/home/data/data_sources/remote/home_remote_data_sources_imp.dart';
import 'package:tracking_app/features/home/domain/entities/item_order_details_entity.dart';

import 'home_remote_data_sources_imp_test.mocks.dart';

@GenerateMocks([ApiManager, HomeRetrofitClient])
void main() {
  group('testing get all pending my_orders data source', () {
    late HomeRemoteDataSourcesImp dataSource;
    late MockApiManager mockApiManager;
    late MockHomeRetrofitClient mockClient;
    setUp(() {
      mockApiManager = MockApiManager();
      mockClient = MockHomeRetrofitClient();
      dataSource = HomeRemoteDataSourcesImp(mockApiManager, mockClient);
    });
    // test('get all pending my_orders should return success', () async {
    //   final successResult =
    //       SuccessResult<ItemOrderDetailsEntity>(const ItemOrderDetailsEntity());
    //   provideDummy<Result<ItemOrderDetailsEntity>>(successResult);
    //   when(mockClient.getAllPendingOrders('token'))
    //       .thenAnswer((_) async => successResult);
    //   final act = await dataSource.getAllPendingOrders();
    // });
  });
}
