import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/home/domain/entities/item_order_details_entity.dart';
import 'package:tracking_app/features/home/domain/repositories/home_repository.dart';
import 'package:tracking_app/features/home/domain/use_cases/get_all_pending_order_use_case.dart';

import 'get_all_pending_order_use_case_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  group('Get All Pending Order UseCase', () {
    late GetAllPendingOrderUseCase useCase;
    late MockHomeRepository repository;

    setUp(() {
      repository = MockHomeRepository();
      useCase = GetAllPendingOrderUseCase(repository);
    });

    test('should return success when repository returns success', () async {
      final successResult =
          SuccessResult<ItemOrderDetailsEntity>(const ItemOrderDetailsEntity());
      provideDummy<Result<ItemOrderDetailsEntity>>(successResult);
      when(repository.getAllPendingOrders()).thenAnswer((_) async => successResult);

      final act = await useCase.call();

      expect(act, isA<SuccessResult<ItemOrderDetailsEntity>>());
      expect((act as SuccessResult).data, equals(const ItemOrderDetailsEntity()));
      verify(repository.getAllPendingOrders()).called(1);
    });

    test('should return error when repository returns error', () async {
      final errorResult = FailureResult<ItemOrderDetailsEntity>(Exception());
      provideDummy<Result<ItemOrderDetailsEntity>>(errorResult);
      when(repository.getAllPendingOrders()).thenAnswer((_) async => errorResult);

      final act = await useCase.call();

      expect(act, isA<FailureResult<ItemOrderDetailsEntity>>());
      verify(repository.getAllPendingOrders()).called(1);
    });
  });
}
