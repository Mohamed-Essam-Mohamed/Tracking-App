
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/domain/entities/request/login/login_request_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/login_response_entity.dart';
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:tracking_app/features/auth/domain/use_cases/login_use_case.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late LoginUseCase useCase;
  late MockAuthRepository repo;
  late LoginRequestEntity requestData;

  setUp(() {
    repo = MockAuthRepository();
    useCase = LoginUseCase(repo);
    requestData = LoginRequestEntity(
      password: 'new@123',
      email: 'new@mail.com',
    );
  });

  group('LoginUseCase Tests', () {
    test(
        'should call login on the repo and return SuccessResult when repository succeeds',
            () async {
          final response = LoginResponseEntity(
              message: 'user logged successfully');
          final result = SuccessResult<LoginResponseEntity?>(response);
          provideDummy<Result<LoginResponseEntity?>>(result);
          when(repo.login(requestData)).thenAnswer((_) async => result);

          final actual = await useCase.call(requestData);

          verify(repo.login(requestData)).called(1);
          expect(actual, isA<SuccessResult<LoginResponseEntity?>>());
          expect((actual as SuccessResult).data.message,
              'user logged successfully');
        });

    test(
        'should call login on the repo and return FailureResult when repository fails',
            () async {
          final exception = Exception('email or password not valid');
          final result = FailureResult<LoginResponseEntity?>(exception);
          provideDummy<Result<LoginResponseEntity?>>(result);

          when(repo.login(requestData)).thenAnswer((_) async => result);

          final actual = await useCase.call(requestData);

          verify(repo.login(requestData)).called(1);
          expect(actual, isA<FailureResult<LoginResponseEntity?>>());
          expect((actual as FailureResult).exception.toString(),
              contains('email or password not valid'));
        });
  });
}
