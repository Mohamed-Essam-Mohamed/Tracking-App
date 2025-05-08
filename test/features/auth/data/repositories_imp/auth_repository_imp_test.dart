import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/data/models/response/login/login_response_dto.dart';
import 'package:tracking_app/features/auth/data/repositories_imp/auth_repository_imp.dart';
import 'package:tracking_app/features/auth/domain/data_sources/remote/remote_auth_data_source.dart';
import 'package:tracking_app/features/auth/domain/entities/request/login/login_request_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/login_response_entity.dart';

import 'auth_repository_imp_test.mocks.dart';

@GenerateMocks([RemoteAuthDataSource])
void main() {
  late MockRemoteAuthDataSource mockRemoteDataSource;
  late AuthRepositoryImp repository;
  late LoginRequestEntity requestEntity;
  late LoginResponseDto responseDto;
  provideDummy<Result<LoginResponseDto?>>(
    FailureResult(Exception("dummy")),
  );

  setUp(() {
    mockRemoteDataSource = MockRemoteAuthDataSource();
    repository = AuthRepositoryImp(mockRemoteDataSource);

    requestEntity = LoginRequestEntity(
      password: 'new@123',
      email: 'new@mail.com',
    );

    responseDto = LoginResponseDto(message: 'Password updated', token : '');

  });

  group('AuthRepositoryImpl.login', () {
    test('should return SuccessResult when remote data source succeeds', () async {
      when(mockRemoteDataSource.login(any))
          .thenAnswer((_) async => SuccessResult(responseDto));

      final result = await repository.login(requestEntity);

      expect(result, isA<SuccessResult<LoginResponseEntity?>>());
      expect((result as SuccessResult).data!.message, equals('Password updated'));
      verify(mockRemoteDataSource.login(any)).called(1);
    });

    test('should return FailureResult when remote data source fails', () async {
      final exception = Exception('Something went wrong');
      when(mockRemoteDataSource.login(any))
          .thenAnswer((_) async => FailureResult(exception));

      final result = await repository.login(requestEntity);

      expect(result, isA<FailureResult<LoginResponseEntity?>>());
      expect((result as FailureResult).exception, equals(exception));
      verify(mockRemoteDataSource.login(any)).called(1);
    });


    test('should return generic FailureResult when result is not Success or Failure', () async {
      final exception = Exception('Unknown error occurred');

      when(mockRemoteDataSource.login(any))
          .thenAnswer((_) async => FailureResult(exception));

      final result = await repository.login(requestEntity);

      expect(result, isA<FailureResult<LoginResponseEntity?>>());
      expect((result as FailureResult).exception.toString(),
          contains("Unknown error occurred"));

    });
  });
}
