import 'package:tracking_app/features/profile/data/models/request/change_password/change_password_request_model.dart';


class ChangePasswordRequestEntity {

  ChangePasswordRequestEntity({
    required this.password,
    required this.newPassword,
  });
  final String password;
  final String newPassword;

  ChangePasswordRequestDto toDto() => ChangePasswordRequestDto(
      password: password,
      newPassword: newPassword
  );

}
