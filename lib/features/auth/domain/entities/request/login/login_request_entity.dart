import '../../../../data/models/request/login/login_request_dto.dart';

class LoginRequestEntity{
  final String? email;
  final String? password;

  LoginRequestEntity({
    this.email,
    this.password,
  });

  LoginRequestDto toDto() => LoginRequestDto(
    email: email,
      password: password,

  );

}