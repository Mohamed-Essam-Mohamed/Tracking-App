import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/home/data/repositories_impl/home_repository_imp.dart';
import 'package:tracking_app/features/home/domain/data_sources/remote/home_remote_data_source.dart';
import 'package:tracking_app/features/home/domain/entities/item_order_details_entity.dart';

import 'home_repository_imp_test.mocks.dart';

@GenerateMocks([HomeRemoteDataSource])
void main() {
  group('Home Repository Imp testing', () {
    late MockHomeRemoteDataSource mockDataSource;
    late HomeRepositoryImp repository;

    setUp(() {
      mockDataSource = MockHomeRemoteDataSource();
      repository = HomeRepositoryImp(mockDataSource);
    });

    test('should return success when repository returns success', () async {
      final successResult =
          SuccessResult<ItemOrderDetailsEntity>(const ItemOrderDetailsEntity());
      provideDummy<Result<ItemOrderDetailsEntity>>(successResult);
      when(mockDataSource.getAllPendingOrders()).thenAnswer((_) async => successResult);

      final act = await repository.getAllPendingOrders();

      expect(act, isA<SuccessResult<ItemOrderDetailsEntity>>());
      expect((act as SuccessResult).data, equals(const ItemOrderDetailsEntity()));
      verify(mockDataSource.getAllPendingOrders()).called(1);
    });

    test('should return error when repository returns error', () async {
      final errorResult = FailureResult<ItemOrderDetailsEntity>(Exception());
      provideDummy<Result<ItemOrderDetailsEntity>>(errorResult);
      when(mockDataSource.getAllPendingOrders()).thenAnswer((_) async => errorResult);

      final act = await repository.getAllPendingOrders();

      expect(act, isA<FailureResult<ItemOrderDetailsEntity>>());
      verify(mockDataSource.getAllPendingOrders()).called(1);
    });
  });
}
