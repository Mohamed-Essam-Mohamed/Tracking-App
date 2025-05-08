// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:tracking_app/core/network/common/api_result.dart';
// import 'package:tracking_app/core/network/remote/api_manager.dart';
// import 'package:tracking_app/features/auth/data/api/auth_retrofit_client.dart';
// import 'package:tracking_app/features/auth/data/data_sources_imp/remote/remote_auth_data_source_imp.dart';
// import 'package:tracking_app/features/auth/data/models/request/login/login_request_dto.dart';
// import 'package:tracking_app/features/auth/data/models/response/login/login_response_dto.dart';
//
// import 'remote_auth_data_source_imp_test.mocks.dart';
//
// @GenerateMocks([AuthRetrofitClient, ApiManager])
// void main() {
//   group("Login Data Source testing", () {
//     late RemoteAuthDataSourceImp dataSource;
//     late MockAuthRetrofitClient mockClient;
//     late MockApiManager mockApiManager;
//
//     setUp(() {
//       mockClient = MockAuthRetrofitClient();
//       mockApiManager = MockApiManager();
//       dataSource = RemoteAuthDataSourceImp(mockApiManager, mockClient);
//     });
//
//     test("login should return SuccessResult with LoginResponseDto", () async {
//       final loginRequestDto = LoginRequestDto();
//       final loginResponseDto = LoginResponseDto(message: "Login successful");
//
//       when(mockClient.login(loginRequestDto))
//           .thenAnswer((_) async => loginResponseDto);
//
//       when(mockApiManager.execute<LoginResponseDto?>(any))
//           .thenAnswer((invocation) async {
//         final fn = invocation.positionalArguments[0] as Future<LoginResponseDto?> Function();
//         return SuccessResult<LoginResponseDto?>(await fn());
//       });
//
//       final actual = await dataSource.login(loginRequestDto);
//
//       expect(actual, isA<SuccessResult<LoginResponseDto?>>());
//       expect((actual as SuccessResult).data?.message, equals("Login successful"));
//
//       verify(mockApiManager.execute<LoginResponseDto?>(any)).called(1);
//       verify(mockClient.login(loginRequestDto)).called(1);
//     });
//   });
// }
