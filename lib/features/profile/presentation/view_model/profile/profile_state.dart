import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/enum/status.dart';
import 'package:tracking_app/features/profile/domain/entities/logout/logout_response_entity.dart';
import 'package:tracking_app/features/profile/domain/entities/profile_data/profile_data_entity.dart';

extension ProfileStateExtension on ProfileState {
  bool get isGetProfileLoading => statusGetProfile == Status.loading;
  bool get isGetProfileSuccess => statusGetProfile == Status.success;
  bool get isGetProfileFailure => statusGetProfile == Status.failure;
  bool get isLogOutLoading => statusLogOut == Status.loading;
  bool get isLogOutSuccess => statusLogOut == Status.success;
  bool get isLogOutFailure => statusLogOut == Status.failure;
}

class ProfileState extends Equatable {
  const ProfileState({
    this.statusLogOut = Status.initial,
    this.statusGetProfile = Status.initial,
    this.errorMessage = '',
    this.profileData = const ProfileDataEntity(),
    this.logoutData = const LogoutResponseEntity(),
  });

  final Status statusLogOut;
  final Status statusGetProfile;
  final ProfileDataEntity profileData;
  final LogoutResponseEntity logoutData;
  final String errorMessage;

  ProfileState copyWith({
    Status? statusLogOut,
    Status? statusGetProfile,
    String? errorMessage,
    ProfileDataEntity? profileData,
    LogoutResponseEntity? logoutData,
  }) {
    return ProfileState(
      statusLogOut: statusLogOut ?? this.statusLogOut,
      statusGetProfile: statusGetProfile ?? this.statusGetProfile,
      errorMessage: errorMessage ?? this.errorMessage,
      profileData: profileData ?? this.profileData,
      logoutData: logoutData ?? this.logoutData,
    );
  }

  @override
  List<Object?> get props => [
        statusLogOut,
        statusGetProfile,
        errorMessage,
        profileData,
        logoutData,
      ];
}

sealed class ProfileScreenAction {}

final class LogoutAction extends ProfileScreenAction {}

final class GetProfileAction extends ProfileScreenAction {}
