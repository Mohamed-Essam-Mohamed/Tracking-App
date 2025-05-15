import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/base_state/base_state.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/domain/entities/request/login/login_request_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/driver_data_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/login_response_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/vehicle_type_entity.dart';
import 'package:tracking_app/features/auth/domain/use_cases/get_driver_data_use_case.dart';
import 'package:tracking_app/features/auth/domain/use_cases/get_vehicle_type_use_case.dart';
import 'package:tracking_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:tracking_app/features/auth/presentation/view_model/login/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase, this._getDriverDataUseCase,
      this._getVehicleTypeUseCase)
      : super(LoginState(baseState: BaseInitialState())) {
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    _checkRememberMe();
  }
  final LoginUseCase _loginUseCase;
  final GetDriverDataUseCase _getDriverDataUseCase;
  final GetVehicleTypeUseCase _getVehicleTypeUseCase;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late bool rememberMe = false;

  void toggleRememberMe(bool? value) async {
    rememberMe = value ?? false;

    if (rememberMe) {
      await _saveUserLoginData();
    } else {
      await _clearUserData();
    }

    emit(state.copyWith(
      baseState: BaseInitialState(),
      rememberMe: rememberMe,
    ));
  }

  Future<void> _checkRememberMe() async {
    final pref = await SharedPreferences.getInstance();
    final email = pref.getString('email');
    final password = pref.getString('password');
    final remember = pref.getBool('rememberMe') ?? false;
    if (remember) {
      emailController.text = email ?? '';
      passwordController.text = password ?? '';
      rememberMe = true;
      emit(state.copyWith(
          rememberMe: rememberMe, baseState: BaseInitialState()));
    }
  }

  void doIntent(LoginAction action) {
    switch (action) {
      case LoginAction():
        if (formKey.currentState?.validate() ?? false) {
          _login();
        }
    }
  }

  void _validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (state.isFormValid != isValid) {
      emit(state.copyWith(isFormValid: isValid));
    }
  }

  Future<LoginResponseEntity?> _login() async {
    final LoginRequestEntity loginRequestEntity = LoginRequestEntity(
        password: passwordController.text, email: emailController.text);

    emit(state.copyWith(baseState: BaseLoadingState()));

    final result = await _loginUseCase.call(loginRequestEntity);
    switch (result) {
      case SuccessResult<LoginResponseEntity?>():
        {
          if (rememberMe) {
            _saveUserLoginData();
          }
          await _setLoggedInState(true, result.data?.token);
          _getDriverData();

          emit(state.copyWith(baseState: BaseSuccessState(data: result)));
        }
      case FailureResult<LoginResponseEntity?>():
        {
          emit(
            state.copyWith(
              baseState: BaseErrorState(
                  errorMessage: result.exception.toString(),
                  exception: result.exception),
            ),
          );
        }
    }
    return null;
  }

  Future<DriverDataEntity?> _getDriverData() async {
    final result = await _getDriverDataUseCase.call();
    switch (result) {
      case SuccessResult<DriverDataEntity?>():
        {
          await _saveUserData(result.data!);
          final vehicleId = await _getUserVehicleType();
        }
      case FailureResult<DriverDataEntity?>():
        {
          print("couldn't save user data");
        }
    }
    return null;
  }

  Future<VehicleTypeEntity?> _getVehicleType(String vehicleType) async {
    final result = await _getVehicleTypeUseCase.call(vehicleType);
    switch (result) {
      case SuccessResult<VehicleTypeEntity?>():
        {
          await _saveVehicleType(result.data!);
        }
      case FailureResult<VehicleTypeEntity?>():
        {
          print("couldn't save vehicle data");
        }
    }
    return null;
  }

  Future<void> _saveVehicleType(VehicleTypeEntity vehicleTypeResponse) async {
    final VehicleEntity? vehicleType = vehicleTypeResponse.vehicle;
    print(
        "-----------------------------------vehicle type from _saveVehicleType $vehicleType");
    final pref = await SharedPreferences.getInstance();
    pref.setString('VehicleId', vehicleType?.id ?? 'test');
    pref.setString('VehicleImage', vehicleType?.image ?? 'test');
    pref.setString('VehicleType', vehicleType?.type ?? 'test');
  }

  Future<void> _getUserVehicleType() async {
    final pref = await SharedPreferences.getInstance();
    final vehicleId = pref.getString('vehicleType');
    print("----------------------- _getUserVehicleType : $vehicleId");
    await _getVehicleType(vehicleId!);
  }

  Future<void> _saveUserData(DriverDataEntity driverDataResponse) async {
    final DriverEntity? driverData = driverDataResponse.driver;
    print("    driverData.vehicleType ${driverData?.vehicleType}");
    final pref = await SharedPreferences.getInstance();
    pref.setString('firstName', driverData?.firstName ?? 'test');
    pref.setString('lastName', driverData?.lastName ?? 'test');
    pref.setString('vehicleType', driverData?.vehicleType ?? 'test');
    pref.setString('vehicleNumber', driverData?.vehicleNumber ?? 'test');
    pref.setString('vehicleLicense', driverData?.vehicleLicense ?? 'test');
    pref.setString('phone', driverData?.phone ?? 'test');
    pref.setString('nid', driverData?.nid ?? 'test');
    pref.setString('role', driverData?.role ?? 'test');
    pref.setString('gender', driverData?.gender ?? 'test');
    pref.setString('country', driverData?.country ?? 'test');
    pref.setString('email', driverData?.email ?? 'test');
    pref.setString('photo', driverData?.photo ?? 'test');
  }

  Future<void> _saveUserLoginData() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('email', emailController.text);
    pref.setString('password', passwordController.text);
    pref.setBool('rememberMe', rememberMe);
  }

  Future<void> _clearUserData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('email');
    await pref.remove('password');
    await pref.remove('rememberMe');
  }

  Future<void> _setLoggedInState(bool isLoggedIn, String? userToken) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isLoggedIn', isLoggedIn);
    pref.setString('token', userToken ?? '');
  }

  @override
  Future<void> close() {
    emailController
      ..removeListener(_validateForm)
      ..dispose();
    passwordController
      ..removeListener(_validateForm)
      ..dispose();
    return super.close();
  }
}
