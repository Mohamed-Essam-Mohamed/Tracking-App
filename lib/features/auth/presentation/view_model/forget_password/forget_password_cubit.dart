import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base_state/base_state.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/data/models/request/forget_request_dto.dart';
import 'package:tracking_app/features/auth/data/models/response/reset_password_request.dart';
import 'package:tracking_app/features/auth/data/models/response/verify_code_request.dart';
import 'package:tracking_app/features/auth/domain/use_cases/email_verification_use_case.dart';

import 'package:tracking_app/features/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:tracking_app/features/auth/domain/use_cases/reset_password_use_case.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final EmailVerificationUseCase _emailVerificationUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  ForgetPasswordCubit(
      this._forgetPasswordUseCase, this._emailVerificationUseCase,this._resetPasswordUseCase)
      : super(ForgetPasswordState());
  forgetPassword(ForgetRequestDto forgetRequest) async {
    emit(state.copyWith(forgetState: BaseLoadingState()));
    final result = await _forgetPasswordUseCase(forgetRequest);
    switch (result) {
      case SuccessResult():
        emit(state.copyWith(forgetState: BaseSuccessState(data: result.data)));
        break;
      case FailureResult():
        emit(state.copyWith(
            forgetState:
                BaseErrorState(errorMessage: result.exception.toString())));
        break;
    }
  }

  emailVerify(VerifyCodeRequest verifyCode) async {
    emit(state.copyWith(verifyCodeState: BaseLoadingState()));
    final result = await _emailVerificationUseCase(verifyCode);
    switch (result) {
      case SuccessResult():
        emit(state.copyWith(
            verifyCodeState: BaseSuccessState(data: result.data)));
      case FailureResult():
        emit(state.copyWith(
            verifyCodeState:
                BaseErrorState(errorMessage: result.exception.toString())));
    }
  }
   
   resetPassword(ResetPasswordRequest resetPassword)async{
    emit(state.copyWith(resetPassowrdStat: BaseLoadingState()));
    final result=await _resetPasswordUseCase(resetPassword);
    switch(result){
     case SuccessResult():
     emit(state.copyWith(resetPassowrdStat: BaseSuccessState()));
     case FailureResult():
     emit(state.copyWith(resetPassowrdStat: BaseErrorState(errorMessage: result.exception.toString())));
    }
   }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
}
