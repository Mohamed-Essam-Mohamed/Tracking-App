
import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/profile/domain/entities/logout/logout_response_entity.dart';
part 'logout_response_dto.g.dart';

@JsonSerializable()
class LogoutResponseDto {
  LogoutResponseDto({
      this.message,});

  factory LogoutResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LogoutResponseDtoToJson(this);
  String? message;

  LogoutResponseEntity toDomain() {
    return LogoutResponseEntity(
      message: message,
    );
  }


}