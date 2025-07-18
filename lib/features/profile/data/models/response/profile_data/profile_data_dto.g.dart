// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDataResponseDto _$ProfileDataResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ProfileDataResponseDto(
      message: json['message'] as String?,
      driver: json['driver'] == null
          ? null
          : DriverResponseDto.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileDataResponseDtoToJson(
        ProfileDataResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'driver': instance.driver,
    };

DriverResponseDto _$DriverResponseDtoFromJson(Map<String, dynamic> json) =>
    DriverResponseDto(
      role: json['role'] as String?,
      sId: json['_id'] as String?,
      country: json['country'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      vehicleType: json['vehicleType'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      vehicleLicense: json['vehicleLicense'] as String?,
      nID: json['nID'] as String?,
      nIDImg: json['nIDImg'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$DriverResponseDtoToJson(DriverResponseDto instance) =>
    <String, dynamic>{
      'role': instance.role,
      '_id': instance.sId,
      'country': instance.country,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'vehicleType': instance.vehicleType,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleLicense': instance.vehicleLicense,
      'nID': instance.nID,
      'nIDImg': instance.nIDImg,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'createdAt': instance.createdAt,
    };
