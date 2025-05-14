// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:tracking_app/core/logger/logger_module.dart' as _i403;
import 'package:tracking_app/core/network/remote/api_manager.dart' as _i481;
import 'package:tracking_app/core/network/remote/dio_module.dart' as _i896;
import 'package:tracking_app/features/auth/data/api/auth_retrofit_client.dart' as _i272;
import 'package:tracking_app/features/auth/data/data_sources_imp/remote/remote_auth_data_source_imp.dart'
    as _i121;
import 'package:tracking_app/features/auth/data/repositories_imp/auth_repository_imp.dart'
    as _i701;
import 'package:tracking_app/features/auth/domain/data_sources/remote/remote_auth_data_source.dart'
    as _i13;
import 'package:tracking_app/features/auth/domain/repositories/auth_repository.dart'
    as _i632;
import 'package:tracking_app/features/auth/domain/use_cases/apply_use_cases.dart'
    as _i834;
import 'package:tracking_app/features/auth/domain/use_cases/email_verification_use_case.dart'
    as _i12;
import 'package:tracking_app/features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i717;
import 'package:tracking_app/features/auth/domain/use_cases/login_use_case.dart' as _i862;
import 'package:tracking_app/features/auth/domain/use_cases/reset_password_use_case.dart'
    as _i44;
import 'package:tracking_app/features/auth/presentation/view_model/apply/apply_cubit.dart'
    as _i554;
import 'package:tracking_app/features/auth/presentation/view_model/forget_password/forget_password_cubit.dart'
    as _i943;
import 'package:tracking_app/features/auth/presentation/view_model/login/login_cubit.dart'
    as _i578;
import 'package:tracking_app/features/order_details/data/api/order_details_retrofit_client.dart'
    as _i852;
import 'package:tracking_app/features/order_details/data/data_sources/data_source_imp.dart'
    as _i873;
import 'package:tracking_app/features/order_details/data/data_sources/data_sources.dart'
    as _i445;
import 'package:tracking_app/features/order_details/data/repositories_imp/order_details_repositories_impl.dart'
    as _i641;
import 'package:tracking_app/features/order_details/domain/repositories/order_details_repositories.dart'
    as _i769;
import 'package:tracking_app/features/order_details/domain/use_cases/order_details_use_case.dart'
    as _i967;
import 'package:tracking_app/features/order_details/presentation/view_model/order_details_cubit.dart'
    as _i429;
import 'package:tracking_app/features/home/data/api/home_retrofit_client.dart' as _i95;
import 'package:tracking_app/features/home/data/data_sources/remote/home_remote_data_sources_imp.dart'
    as _i35;
import 'package:tracking_app/features/home/data/repositories_impl/home_repository_imp.dart'
    as _i325;
import 'package:tracking_app/features/home/domain/data_sources/remote/home_remote_data_source.dart'
    as _i623;
import 'package:tracking_app/features/home/domain/repositories/home_repository.dart'
    as _i421;
import 'package:tracking_app/features/home/domain/use_cases/get_all_pending_order_use_case.dart'
    as _i505;
import 'package:tracking_app/features/home/presentation/view_model/pending_order/pending_order_cubit.dart'
    as _i175;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final loggerModule = _$LoggerModule();
    final dioModule = _$DioModule();
    gh.singleton<_i481.ApiManager>(() => _i481.ApiManager());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioModule.providerInterceptor());
    gh.lazySingleton<_i272.AuthRetrofitClient>(
        () => _i272.AuthRetrofitClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i852.OrderDetailsRetrofitClient>(
        () => _i852.OrderDetailsRetrofitClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i95.HomeRetrofitClient>(
        () => _i95.HomeRetrofitClient(gh<_i361.Dio>()));
    gh.factory<_i13.RemoteAuthDataSource>(() => _i121.RemoteAuthDataSourceImp(
          gh<_i481.ApiManager>(),
          gh<_i272.AuthRetrofitClient>(),
        ));
    gh.factory<_i445.OrderDetailsDataSource>(() => _i873.OrderDetailsDataSourceImp(
          gh<_i481.ApiManager>(),
          gh<_i852.OrderDetailsRetrofitClient>(),
        ));
    gh.factory<_i769.OrderDetailsRepositories>(
        () => _i641.OrderDetailsRepositoriesImpl(gh<_i445.OrderDetailsDataSource>()));
    gh.factory<_i623.HomeRemoteDataSource>(() => _i35.HomeRemoteDataSourcesImp(
          gh<_i481.ApiManager>(),
          gh<_i95.HomeRetrofitClient>(),
        ));
    gh.factory<_i421.HomeRepository>(
        () => _i325.HomeRepositoryImp(gh<_i623.HomeRemoteDataSource>()));
    gh.factory<_i632.AuthRepository>(
        () => _i701.AuthRepositoryImp(gh<_i13.RemoteAuthDataSource>()));
    gh.factory<_i505.GetAllPendingOrderUseCase>(
        () => _i505.GetAllPendingOrderUseCase(gh<_i421.HomeRepository>()));
    gh.factory<_i12.EmailVerificationUseCase>(
        () => _i12.EmailVerificationUseCase(gh<_i632.AuthRepository>()));
    gh.factory<_i717.ForgetPasswordUseCase>(
        () => _i717.ForgetPasswordUseCase(gh<_i632.AuthRepository>()));
    gh.factory<_i862.LoginUseCase>(() => _i862.LoginUseCase(gh<_i632.AuthRepository>()));
    gh.factory<_i44.ResetPasswordUseCase>(
        () => _i44.ResetPasswordUseCase(gh<_i632.AuthRepository>()));
    gh.factory<_i967.OrderDetailsUseCase>(
        () => _i967.OrderDetailsUseCase(gh<_i769.OrderDetailsRepositories>()));
    gh.factory<_i578.LoginCubit>(() => _i578.LoginCubit(gh<_i862.LoginUseCase>()));
    gh.factory<_i834.ApplyUseCases>(
        () => _i834.ApplyUseCases(gh<_i632.AuthRepository>()));
    gh.factory<_i943.ForgetPasswordCubit>(() => _i943.ForgetPasswordCubit(
          gh<_i717.ForgetPasswordUseCase>(),
          gh<_i12.EmailVerificationUseCase>(),
          gh<_i44.ResetPasswordUseCase>(),
        ));
    gh.factory<_i429.OrderDetailsCubit>(() =>
        _i429.OrderDetailsCubit(orderDetailsUseCase: gh<_i967.OrderDetailsUseCase>()));
    gh.factory<_i175.PendingOrderCubit>(
        () => _i175.PendingOrderCubit(gh<_i505.GetAllPendingOrderUseCase>()));
    gh.factory<_i554.ApplyCubit>(() => _i554.ApplyCubit(gh<_i834.ApplyUseCases>()));
    return this;
  }
}

class _$LoggerModule extends _i403.LoggerModule {}

class _$DioModule extends _i896.DioModule {}
