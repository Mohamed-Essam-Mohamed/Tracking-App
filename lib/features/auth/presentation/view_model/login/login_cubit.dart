import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/base_state/base_state.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/domain/entities/request/login/login_request_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/login_response_entity.dart';
import 'package:tracking_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:tracking_app/features/auth/presentation/view_model/login/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginState(baseState: BaseInitialState())) {
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    _checkRememberMe();
  }
  final LoginUseCase _loginUseCase;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late bool rememberMe = false;

  void toggleRememberMe(bool? value) async {
    rememberMe = value ?? false;

    if (rememberMe) {
      await _saveUserData();
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
      emit(state.copyWith(rememberMe: rememberMe, baseState: BaseInitialState()));
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
            _saveUserData();
          }
          await _setLoggedInState(true);

          emit(state.copyWith(baseState: BaseSuccessState(data: result)));
        }
      case FailureResult<LoginResponseEntity?>():
        {
          emit(
            state.copyWith(
              baseState: BaseErrorState(
                  errorMessage: result.exception.toString(), exception: result.exception),
            ),
          );
        }
    }
    return null;
  }

  Future<void> _saveUserData() async {
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

  Future<void> _setLoggedInState(bool isLoggedIn) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isLoggedIn', isLoggedIn);
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
