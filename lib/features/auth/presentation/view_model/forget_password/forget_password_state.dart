part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  ForgetPasswordState({this.forgetState, this.verifyCodeState, this.resetPasswordState});
  BaseState? forgetState;
  BaseState? verifyCodeState;
  BaseState? resetPasswordState;
  ForgetPasswordState copyWith(
      {BaseState? forgetState,
      BaseState? verifyCodeState,
      BaseState? resetPasswordState}) {
    return ForgetPasswordState(
        forgetState: forgetState ?? this.forgetState,
        verifyCodeState: verifyCodeState ?? this.verifyCodeState,
        resetPasswordState: resetPasswordState ?? this.resetPasswordState);
  }

  @override
  List<Object?> get props => [forgetState, verifyCodeState, resetPasswordState];
}
