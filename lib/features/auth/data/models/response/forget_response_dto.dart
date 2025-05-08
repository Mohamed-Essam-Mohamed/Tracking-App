import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/auth/domain/entities/forget_password_entity.dart';
part 'forget_response_dto.g.dart';
@JsonSerializable()
class ForgetResponseDto {
  String message;
  String info;
  ForgetResponseDto({
    required this.message,
    required this.info,
  });


  factory ForgetResponseDto.fromJson(Map<String, dynamic> json) => _$ForgetResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ForgetResponseDtoToJson(this);

  ForgetPasswordEntity toDomain() => ForgetPasswordEntity(message: message, info: info);
}



