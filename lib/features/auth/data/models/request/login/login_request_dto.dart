import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDto {
  final String? email;
  final String? password;

  LoginRequestDto({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);

  // LoginRequestEntity toDomain() {
  //   return LoginRequestEntity(
  //     email: email,
  //     password: password ,
  //   );
  // }
}
