import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/profile/domain/entities/change_password/change_password__response_entity.dart';

part 'change_password_response_model.g.dart';


@JsonSerializable()
class ChangePasswordResponseDto {

  factory ChangePasswordResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseDtoFromJson(json);
  ChangePasswordResponseDto({
      this.message,
      this.token,
  this.error});

  String? message;
  String? token;
  String? error;

  Map<String, dynamic> toJson() => _$ChangePasswordResponseDtoToJson(this);

  ChangePasswordResponseEntity toDomain() => ChangePasswordResponseEntity(
      message: message,
      token: token,
    error: error
  );

}

