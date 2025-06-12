import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/base_state/base_state.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.baseState,
  });
  final BaseState? baseState;

  ProfileState copyWith({
    BaseState? baseState,
  }) {
    return ProfileState(
      baseState: baseState ?? this.baseState,
    );
  }

  @override
  List<Object?> get props => [baseState];
}

sealed class LogoutScreenAction {}

final class LogoutAction extends LogoutScreenAction {}
