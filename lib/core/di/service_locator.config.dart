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
import 'package:tracking_app/features/auth/data/api/auth_retrofit_client.dart'
    as _i272;
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
import 'package:tracking_app/features/auth/domain/use_cases/get_driver_data_use_case.dart'
    as _i48;
import 'package:tracking_app/features/auth/domain/use_cases/get_vehicle_type_use_case.dart'
    as _i371;
import 'package:tracking_app/features/auth/domain/use_cases/login_use_case.dart'
    as _i862;
import 'package:tracking_app/features/auth/domain/use_cases/reset_password_use_case.dart'
    as _i44;
import 'package:tracking_app/features/auth/presentation/view_model/apply/apply_cubit.dart'
    as _i554;
import 'package:tracking_app/features/auth/presentation/view_model/forget_password/forget_password_cubit.dart'
    as _i943;
import 'package:tracking_app/features/auth/presentation/view_model/login/login_cubit.dart'
    as _i578;
import 'package:tracking_app/features/home/data/api/home_retrofit_client.dart'
    as _i95;
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
import 'package:tracking_app/features/home/presentation/view_model/order_details/order_details_cubit.dart'
    as _i36;
import 'package:tracking_app/features/home/presentation/view_model/pending_order/pending_order_cubit.dart'
    as _i175;
import 'package:tracking_app/features/my_orders/data/api/driver_orders_retrofit_client.dart'
    as _i363;
import 'package:tracking_app/features/my_orders/data/data_sources/driver_orders_data_source_imp.dart'
    as _i448;
import 'package:tracking_app/features/my_orders/data/data_sources/remote/driver_orders_data_source.dart'
    as _i728;
import 'package:tracking_app/features/my_orders/data/repositories_imp/driver_orders_repository_imp.dart'
    as _i290;
import 'package:tracking_app/features/my_orders/domain/repositories/driver_orders_repository.dart'
    as _i760;
import 'package:tracking_app/features/my_orders/domain/use_cases/driver_orders_use_cases.dart'
    as _i153;
import 'package:tracking_app/features/my_orders/presentation/view_model/driver_orders_cubit.dart'
    as _i379;
import 'package:tracking_app/features/profile/data/api/profile_retrofit_client.dart'
    as _i846;
import 'package:tracking_app/features/profile/data/data_sources/remote/profile_data_source_imp.dart'
    as _i759;
import 'package:tracking_app/features/profile/data/repositories_impl/profile_repository_imp.dart'
    as _i747;
import 'package:tracking_app/features/profile/domain/data_source/profile_data_source.dart'
    as _i745;
import 'package:tracking_app/features/profile/domain/repositories/profile_repository.dart'
    as _i859;
import 'package:tracking_app/features/profile/domain/use_cases/change_password_usecase.dart'
    as _i163;
import 'package:tracking_app/features/profile/domain/use_cases/get_profile_data_usecase.dart'
    as _i487;
import 'package:tracking_app/features/profile/domain/use_cases/logout_usecase.dart'
    as _i212;
import 'package:tracking_app/features/profile/presentation/view_model/change_password/change_password_cubit.dart'
    as _i213;
import 'package:tracking_app/features/profile/presentation/view_model/profile/profile_cubit.dart'
    as _i466;

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
    gh.factory<_i36.OrderDetailsCubit>(() => _i36.OrderDetailsCubit());
    gh.singleton<_i481.ApiManager>(() => _i481.ApiManager());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => dioModule.providerInterceptor());
    gh.lazySingleton<_i896.AuthInterceptor>(
        () => dioModule.provideAuthInterceptor());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio(
          gh<_i528.PrettyDioLogger>(),
          gh<_i896.AuthInterceptor>(),
        ));
    gh.lazySingleton<_i272.AuthRetrofitClient>(
        () => _i272.AuthRetrofitClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i95.HomeRetrofitClient>(
        () => _i95.HomeRetrofitClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i363.DriverOrdersRetrofitClient>(
        () => _i363.DriverOrdersRetrofitClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i846.ProfileRetrofitClient>(
        () => _i846.ProfileRetrofitClient(gh<_i361.Dio>()));
    gh.factory<_i13.RemoteAuthDataSource>(() => _i121.RemoteAuthDataSourceImp(
          gh<_i481.ApiManager>(),
          gh<_i272.AuthRetrofitClient>(),
        ));
    gh.factory<_i623.HomeRemoteDataSource>(() => _i35.HomeRemoteDataSourcesImp(
          gh<_i481.ApiManager>(),
          gh<_i95.HomeRetrofitClient>(),
        ));
    gh.factory<_i421.HomeRepository>(
        () => _i325.HomeRepositoryImp(gh<_i623.HomeRemoteDataSource>()));
    gh.factory<_i728.DriverOrdersDataSource>(
        () => _i448.DriverOrdersDataSourceImp(
              gh<_i481.ApiManager>(),
              gh<_i363.DriverOrdersRetrofitClient>(),
            ));
    gh.factory<_i745.ProfileDataSource>(() => _i759.ProfileDataSourceImp(
          gh<_i481.ApiManager>(),
          gh<_i846.ProfileRetrofitClient>(),
        ));
    gh.factory<_i632.AuthRepository>(
        () => _i701.AuthRepositoryImp(gh<_i13.RemoteAuthDataSource>()));
    gh.factory<_i859.ProfileRepository>(
        () => _i747.ProfileRepositoryImp(gh<_i745.ProfileDataSource>()));
    gh.factory<_i505.GetAllPendingOrderUseCase>(
        () => _i505.GetAllPendingOrderUseCase(gh<_i421.HomeRepository>()));
    gh.factory<_i163.ChangePasswordUseCase>(
        () => _i163.ChangePasswordUseCase(gh<_i859.ProfileRepository>()));
    gh.factory<_i487.GetProfileDataUseCase>(
        () => _i487.GetProfileDataUseCase(gh<_i859.ProfileRepository>()));
    gh.factory<_i212.LogoutUseCase>(
        () => _i212.LogoutUseCase(gh<_i859.ProfileRepository>()));
    gh.factory<_i760.DriverOrdersRepository>(() =>
        _i290.DriverOrdersRepositoryImp(gh<_i728.DriverOrdersDataSource>()));
    gh.factory<_i12.EmailVerificationUseCase>(
        () => _i12.EmailVerificationUseCase(gh<_i632.AuthRepository>()));
    gh.factory<_i717.ForgetPasswordUseCase>(
        () => _i717.ForgetPasswordUseCase(gh<_i632.AuthRepository>()));
    gh.factory<_i48.GetDriverDataUseCase>(
        () => _i48.GetDriverDataUseCase(gh<_i632.AuthRepository>()));
    gh.factory<_i371.GetVehicleTypeUseCase>(
        () => _i371.GetVehicleTypeUseCase(gh<_i632.AuthRepository>()));
    gh.factory<_i862.LoginUseCase>(
        () => _i862.LoginUseCase(gh<_i632.AuthRepository>()));
    gh.factory<_i44.ResetPasswordUseCase>(
        () => _i44.ResetPasswordUseCase(gh<_i632.AuthRepository>()));
    gh.factory<_i213.ChangePasswordCubit>(
        () => _i213.ChangePasswordCubit(gh<_i163.ChangePasswordUseCase>()));
    gh.factory<_i153.DriverOrdersUseCases>(
        () => _i153.DriverOrdersUseCases(gh<_i760.DriverOrdersRepository>()));
    gh.factory<_i834.ApplyUseCases>(
        () => _i834.ApplyUseCases(gh<_i632.AuthRepository>()));
    gh.factory<_i943.ForgetPasswordCubit>(() => _i943.ForgetPasswordCubit(
          gh<_i717.ForgetPasswordUseCase>(),
          gh<_i12.EmailVerificationUseCase>(),
          gh<_i44.ResetPasswordUseCase>(),
        ));
    gh.factory<_i466.ProfileCubit>(() => _i466.ProfileCubit(
          gh<_i212.LogoutUseCase>(),
          gh<_i487.GetProfileDataUseCase>(),
        ));
    gh.factory<_i175.PendingOrderCubit>(
        () => _i175.PendingOrderCubit(gh<_i505.GetAllPendingOrderUseCase>()));
    gh.factory<_i554.ApplyCubit>(
        () => _i554.ApplyCubit(gh<_i834.ApplyUseCases>()));
    gh.factory<_i578.LoginCubit>(() => _i578.LoginCubit(
          gh<_i862.LoginUseCase>(),
          gh<_i48.GetDriverDataUseCase>(),
          gh<_i371.GetVehicleTypeUseCase>(),
        ));
    gh.factory<_i379.DriverOrdersCubit>(
        () => _i379.DriverOrdersCubit(gh<_i153.DriverOrdersUseCases>()));
    return this;
  }
}

class _$LoggerModule extends _i403.LoggerModule {}

class _$DioModule extends _i896.DioModule {}
