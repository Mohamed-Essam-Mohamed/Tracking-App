import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/enum/status.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/profile/domain/entities/logout/logout_response_entity.dart';
import 'package:tracking_app/features/profile/domain/entities/profile_data/profile_data_entity.dart';
import 'package:tracking_app/features/profile/domain/use_cases/get_profile_data_usecase.dart';
import 'package:tracking_app/features/profile/domain/use_cases/logout_usecase.dart';
import 'package:tracking_app/features/profile/presentation/view_model/profile/profile_state.dart';

import 'package:tracking_app/core/base_state/base_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._logoutUseCase, this._profileDataUseCase)
      : super(const ProfileState());
  final LogoutUseCase _logoutUseCase;
  final GetProfileDataUseCase _profileDataUseCase;

  void doIntent(ProfileScreenAction action) async {
    switch (action) {
      case LogoutAction():
        await _logout();
      case GetProfileAction():
        await _getDataProfile();
    }
  }

  Future<LogoutResponseEntity?> _logout() async {
    final pref = await SharedPreferences.getInstance();
    emit(state.copyWith(statusLogOut: Status.loading));

    final result = await _logoutUseCase.call();
    switch (result) {
      case SuccessResult<LogoutResponseEntity?>():
        {
          await pref.remove('token');
          await pref.remove('isLoggedIn');
          emit(state.copyWith(statusLogOut: Status.success, logoutData: result.data));
        }
      case FailureResult<LogoutResponseEntity?>():
        emit(state.copyWith(
            statusLogOut: Status.failure, errorMessage: result.exception.toString()));
    }
    return null;
  }

  Future<void> _getDataProfile() async {
    emit(state.copyWith(statusGetProfile: Status.loading));
    final result = await _profileDataUseCase.call();
    switch (result) {
      case SuccessResult<ProfileDataEntity>():
        emit(state.copyWith(statusGetProfile: Status.success, profileData: result.data));
      case FailureResult<ProfileDataEntity>():
        emit(state.copyWith(
            statusGetProfile: Status.failure, errorMessage: result.exception.toString()));
    }
  }
}
