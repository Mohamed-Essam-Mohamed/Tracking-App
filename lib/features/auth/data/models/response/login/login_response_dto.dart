import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/login_response_entity.dart';
part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto {
  LoginResponseDto({
    this.message,
    this.token,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);

  final String? message;
  final String? token;

  LoginResponseEntity toDomain() {
    return LoginResponseEntity(
      message: message,
      token: token,
    );
  }
}
