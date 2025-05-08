part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  BaseState? forgetState;
  BaseState? verifyCodeState;
  BaseState?resetPassowrdState;
  ForgetPasswordState({this.forgetState, this.verifyCodeState, this.resetPassowrdState});
  ForgetPasswordState copyWith(
      {BaseState? forgetState, BaseState? verifyCodeState, BaseState? resetPassowrdStat}) {
    return ForgetPasswordState(
        forgetState: forgetState ?? this.forgetState,
        verifyCodeState: verifyCodeState ?? this.verifyCodeState,
        resetPassowrdState: resetPassowrdStat??this.resetPassowrdState
        );
  }

  @override
  List<Object?> get props => [forgetState, verifyCodeState,resetPassowrdState];
}
