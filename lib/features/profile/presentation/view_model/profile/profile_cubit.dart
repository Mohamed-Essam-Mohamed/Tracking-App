import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/profile/domain/entities/logout/logout_response_entity.dart';
import 'package:tracking_app/features/profile/domain/use_cases/logout_usecase.dart';
import 'package:tracking_app/features/profile/presentation/view_model/profile/profile_state.dart';

import 'package:tracking_app/core/base_state/base_state.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileCubit extends Cubit<ProfileState> {

  ProfileCubit(this._logoutUseCase)
      : super(ProfileState(baseState: BaseInitialState()));
  final LogoutUseCase _logoutUseCase;


  void doIntent(ProfileScreenAction action) {
    switch (action) {
      case LogoutAction():
        _logout();



    }
  }

  // ElevatedButton(onPressed: (){
  // Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false);
  //
  // }, child: const Text('logout'))


  Future<LogoutResponseEntity?> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    emit(state.copyWith(baseState: BaseLoadingState()));

    final result = await _logoutUseCase.call();
    switch (result)  {
      case SuccessResult<LogoutResponseEntity?>():
        {
          await prefs.remove('token');
          await prefs.remove('isLoggedIn');

          emit(state.copyWith(baseState: BaseSuccessState(data: result)));
        }      case FailureResult<LogoutResponseEntity?>():
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



}
  

