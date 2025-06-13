import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/vehicle_type_entity.dart';
part 'vehicle_type_dto.g.dart';

@JsonSerializable()
class VehicleTypeDto {

  factory VehicleTypeDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleTypeDtoFromJson(json);
  VehicleTypeDto({
      this.message, 
      this.vehicle,});


  String? message;
  VehicleDto? vehicle;
  Map<String, dynamic> toJson() => _$VehicleTypeDtoToJson(this);

  VehicleTypeEntity toDomain() {
    return VehicleTypeEntity(
      message: message,
      vehicle: vehicle!.toDomain()

    );
  }
}


@JsonSerializable()

class VehicleDto {

  factory VehicleDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleDtoFromJson(json);
  VehicleDto({
      this.id, 
      this.type, 
      this.image, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});


  String? id;
  String? type;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? v;
  Map<String, dynamic> toJson() => _$VehicleDtoToJson(this);

  VehicleEntity toDomain() {
    return VehicleEntity(
       id: id,
      type: type,
       v: v,
      image: image,
      updatedAt: updatedAt,
      createdAt: createdAt
    );
  }


}