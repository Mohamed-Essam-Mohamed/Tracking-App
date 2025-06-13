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
import 'package:firebase_auth/firebase_auth.dart';

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
  final _auth = FirebaseAuth.instance;

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
    await _signInUser( emailController.text,passwordController.text);
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
  Future<void> _signInUser(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.getIdToken();
    } on FirebaseAuthException catch (e) {
        try {
          final newUserCredential = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          print(' Firebase user registered: ${newUserCredential.user!.uid}');
        } on FirebaseAuthException catch (registerError) {
          print(' Registration error: ${registerError.message}');
        }
       if (e.code == 'wrong-password') {
        print(' Wrong password provided for that user.');
      } else {
        print(' Sign-in error: ${e.message}');
      }
    } catch (e) {
      print(' Unexpected error: $e');
    }
  }

  // Future<void> _signInUser(String email, String password) async {
  //   try {
  //     final credential = await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
  //     await credential.user!.getIdToken();
  //     print('Firebase user signed in: ${_auth.currentUser?.uid}');
  //   } on FirebaseAuthException catch (e) {
  //     print(' Sign-in error: ${e.message}');
  //   }
  // }

  Future<DriverDataEntity?> _getDriverData() async {
    final result = await _getDriverDataUseCase.call();
    switch (result) {
      case SuccessResult<DriverDataEntity?>():
        {
          await _saveUserData(result.data!);
          await _getUserVehicleType();
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

    final pref = await SharedPreferences.getInstance();
    pref.setString('VehicleId', vehicleType?.id ?? 'not found');
    pref.setString('VehicleImage', vehicleType?.image ?? 'not found');
    pref.setString('VehicleType', vehicleType?.type ?? 'not found');
  }

  Future<void> _getUserVehicleType() async {
    final pref = await SharedPreferences.getInstance();
    final vehicleId = pref.getString('vehicleType');
    print("----------------------- _getUserVehicleType : $vehicleId");
    await _getVehicleType(vehicleId!);
  }

  Future<void> _saveUserData(DriverDataEntity driverDataResponse) async {
    final DriverEntity? driverData = driverDataResponse.driver;


    final pref = await SharedPreferences.getInstance();
    pref.setString('firstName', driverData?.firstName ?? 'not found');
    pref.setString('lastName', driverData?.lastName ?? 'not found');
    pref.setString('vehicleType', driverData?.vehicleType ?? 'not found');
    pref.setString('vehicleNumber', driverData?.vehicleNumber ?? 'not found');
    pref.setString('vehicleLicense', driverData?.vehicleLicense ?? 'not found');
    pref.setString('phone', driverData?.phone ?? 'not found');
    pref.setString('nid', driverData?.nid ?? 'not found');
    pref.setString('role', driverData?.role ?? 'not found');
    pref.setString('gender', driverData?.gender ?? 'not found');
    pref.setString('country', driverData?.country ?? 'not found');
    pref.setString('email', driverData?.email ?? 'not found');
    pref.setString('photo', driverData?.photo ?? 'not found');
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
