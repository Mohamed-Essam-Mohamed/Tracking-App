import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/auth/domain/entities/reset_password_entity.dart';
part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  String message;
  String token;
  ResetPasswordResponse({required this.message, required this.token});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);

  ResetPasswordEntity toDomain() =>
      ResetPasswordEntity(message: message, token: token);
}
