import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/auth/domain/entities/forget_password_entity.dart';
part 'forget_response_dto.g.dart';

@JsonSerializable()
class ForgetResponseDto {
  factory ForgetResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ForgetResponseDtoFromJson(json);
  const ForgetResponseDto({
    required this.message,
    required this.info,
  });
  final String message;
  final String info;

  Map<String, dynamic> toJson() => _$ForgetResponseDtoToJson(this);

  ForgetPasswordEntity toDomain() => ForgetPasswordEntity(message: message, info: info);
}
