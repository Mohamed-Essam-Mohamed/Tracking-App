import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/entities/response/login/login_response_entity.dart';
part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto {
  LoginResponseDto({
      this.message, 
      this.token,});

  String? message;
  String? token;

  LoginResponseEntity toDomain() {
    return LoginResponseEntity(
      message: message,
      token: token,
    );
  }

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) => _$LoginResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);

}