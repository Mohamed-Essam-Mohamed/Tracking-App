import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/base_state/base_state.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/profile/domain/entities/change_password/change_password__request_entity.dart';
import 'package:tracking_app/features/profile/domain/entities/change_password/change_password__response_entity.dart';
import 'package:tracking_app/features/profile/domain/use_cases/change_password_usecase.dart';
import 'package:tracking_app/features/profile/presentation/view_model/change_password/change_password_state.dart';


@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {


  ChangePasswordCubit(this._changePasswordUseCase) : super(ChangePasswordState(baseState: BaseInitialState(

  ))){
    currentPasswordController.addListener(_validateForm);
    newPasswordController.addListener(_validateForm);
  }
  final ChangePasswordUseCase _changePasswordUseCase;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  void doIntent(ChangePasswordAction action) {
    switch (action) {
      case UpdatePasswordAction():
        if (formKey.currentState?.validate() ?? false) {
          _updatePassword();
        }


    }
  }
  void _validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (state.isFormValid != isValid) {
      emit(state.copyWith(isFormValid: isValid));
    }
  }
  Future<ChangePasswordResponseEntity?> _updatePassword() async {

    final ChangePasswordRequestEntity requestEntity =
    ChangePasswordRequestEntity(
        password: currentPasswordController.text
        , newPassword: newPasswordController.text );

    emit(state.copyWith(baseState: BaseLoadingState()));

    final result = await _changePasswordUseCase.call(requestEntity);
    switch (result)  {
      case SuccessResult<ChangePasswordResponseEntity?>():
        {
          await _saveToken(result.data!.token!);
          emit(state.copyWith(baseState: BaseSuccessState(data: result)));
        }      case FailureResult<ChangePasswordResponseEntity?>():
      {
        emit(state.copyWith(baseState: BaseErrorState(
            errorMessage: result.exception.toString(),
            exception: result.exception),
        ),
        );
      }
    }
    return null;
  }

  Future<void> _saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('token', token);
  }


  @override
  Future<void> close() {
    currentPasswordController
      ..removeListener(_validateForm)
      ..dispose();
    newPasswordController
      ..removeListener(_validateForm)
      ..dispose();
    return super.close();
  }


}



