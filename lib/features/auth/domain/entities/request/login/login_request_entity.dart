import '../../../../data/models/request/login/login_request_dto.dart';

class LoginRequestEntity {
  const LoginRequestEntity({
    this.email,
    this.password,
  });
  final String? email;
  final String? password;

  LoginRequestDto toDto() => LoginRequestDto(
        email: email,
        password: password,
      );
}
