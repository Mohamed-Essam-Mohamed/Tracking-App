import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/profile/domain/entities/profile_data/profile_data_entity.dart';

part 'profile_data_dto.g.dart';

@JsonSerializable()
class ProfileDataResponseDto extends Equatable {
  const ProfileDataResponseDto({this.message, this.driver});
  factory ProfileDataResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataResponseDtoFromJson(json);
  final String? message;
  final DriverResponseDto? driver;

  @override
  List<Object?> get props => [message, driver];

  ProfileDataEntity toEntity() => ProfileDataEntity(
        message: message ?? '',
        driver: driver!.toEntity(),
      );
}

@JsonSerializable()
class DriverResponseDto extends Equatable {
  const DriverResponseDto({
    this.role,
    this.sId,
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nID,
    this.nIDImg,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.createdAt,
  });

  factory DriverResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DriverResponseDtoFromJson(json);

  final String? role;
  @JsonKey(name: '_id')
  final String? sId;
  final String? country;
  final String? firstName;
  final String? lastName;
  final String? vehicleType;
  final String? vehicleNumber;
  final String? vehicleLicense;
  final String? nID;
  final String? nIDImg;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? createdAt;

  DriverEntity toEntity() => DriverEntity(
        sId: sId ?? '',
        firstName: firstName ?? '',
        lastName: lastName ?? '',
        email: email ?? '',
        gender: gender ?? '',
        phone: phone ?? '',
        photo: photo ?? '',
        role: role ?? '',
        country: country ?? '',
        vehicleType: vehicleType ?? '',
        vehicleNumber: vehicleNumber ?? '',
        vehicleLicense: vehicleLicense ?? '',
        nID: nID ?? '',
        nIDImg: nIDImg ?? '',
        createdAt: createdAt ?? '',
      );

  @override
  List<Object?> get props => [
        role,
        sId,
        country,
        firstName,
        lastName,
        vehicleType,
        vehicleNumber,
        vehicleLicense,
        nID,
        nIDImg,
        email,
        gender,
        phone,
        photo,
        createdAt
      ];
}
