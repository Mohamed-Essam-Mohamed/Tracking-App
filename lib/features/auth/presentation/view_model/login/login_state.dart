
import 'package:equatable/equatable.dart';
import '../../../../../../core/base_state/base_state.dart';

class LoginState extends Equatable {
  final BaseState? baseState;
  final bool isFormValid;



  const LoginState({
    this.baseState,
    this.isFormValid = false,


  });

  LoginState copyWith({
    BaseState? baseState,
    bool? isFormValid,
    bool? rememberMe,


  }) {
    return LoginState(
      baseState: baseState ?? this.baseState,
      isFormValid: isFormValid ?? this.isFormValid,



    );
  }

  @override
  List<Object?> get props => [baseState,isFormValid];

}

sealed class LoginScreenAction {}


final class LoginAction extends LoginScreenAction {}


