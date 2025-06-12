import 'package:bloc/bloc.dart';
import 'package:tracking_app/features/profile/domain/use_cases/logout_usecase.dart';
import 'package:tracking_app/features/profile/presentation/view_model/profile/profile_state.dart';

import 'package:tracking_app/core/base_state/base_state.dart';


class ProfileCubit extends Cubit<ProfileState> {
  final LogoutUseCase _logoutUseCase;

  ProfileCubit(this._logoutUseCase)
      : super(ProfileState(baseState: BaseInitialState()));

}
  

