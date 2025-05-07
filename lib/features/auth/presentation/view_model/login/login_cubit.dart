import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/base_state/base_state.dart';
import '../../../../../../core/network/common/api_result.dart';
import '../../../domain/entities/request/login/login_request_entity.dart';
import '../../../domain/entities/response/login/login_response_entity.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   late  bool rememberMe = false;


  LoginCubit(this._loginUseCase)
      : super(LoginState(baseState: BaseInitialState())) {
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
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
    LoginRequestEntity loginRequestEntity = LoginRequestEntity(
        password: passwordController.text, email: emailController.text);

    emit(state.copyWith(baseState: BaseLoadingState()));

    final result = await _loginUseCase.call(loginRequestEntity);
    switch (result) {
      case SuccessResult<LoginResponseEntity?>():
        {
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
