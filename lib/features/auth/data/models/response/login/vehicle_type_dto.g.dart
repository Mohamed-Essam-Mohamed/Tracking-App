// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleTypeDto _$VehicleTypeDtoFromJson(Map<String, dynamic> json) =>
    VehicleTypeDto(
      message: json['message'] as String?,
      vehicle: json['vehicle'] == null
          ? null
          : VehicleDto.fromJson(json['vehicle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleTypeDtoToJson(VehicleTypeDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'vehicle': instance.vehicle,
    };

VehicleDto _$VehicleDtoFromJson(Map<String, dynamic> json) => VehicleDto(
      id: json['id'] as String?,
      type: json['type'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VehicleDtoToJson(VehicleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
