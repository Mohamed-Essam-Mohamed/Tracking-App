import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/auth/domain/entities/response/login/driver_data_entity.dart';
part 'driver_data_dto.g.dart';

@JsonSerializable()
class DriverDataDto {
  DriverDataDto({
      this.message, 
      this.driver,});

  String? message;
  DriverDto? driver;

  factory DriverDataDto.fromJson(Map<String, dynamic> json) =>
      _$DriverDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DriverDataDtoToJson(this);

  DriverDataEntity toDomain() {
    return DriverDataEntity(
      message: message,
      driver : driver!.toDomain()
    );
  }

}


@JsonSerializable()
class DriverDto {
  DriverDto({
      this.id,
      this.country, 
      this.firstName, 
      this.lastName, 
      this.vehicleType, 
      this.vehicleNumber, 
      this.vehicleLicense, 
      this.nid, 
      this.nIDImg, 
      this.email, 
      this.gender, 
      this.phone, 
      this.photo, 
      this.role, 
      this.createdAt,});

  @JsonKey(name: '_id')
  String? id;
  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleLicense;
  String? nid;
  String? nIDImg;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  String? createdAt;

  factory DriverDto.fromJson(Map<String, dynamic> json) =>
      _$DriverDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DriverDtoToJson(this);

  DriverEntity toDomain() {
    return DriverEntity(
      id: id,
      createdAt: createdAt,
      phone: phone,
      email: email,
      lastName: lastName,
      firstName: firstName,
      country: country,
      gender: gender,
      nid: nid,
      nIDImg: nIDImg,
      photo: phone,
      role: role,
      vehicleLicense: vehicleLicense,
      vehicleNumber: vehicleNumber,
      vehicleType: vehicleType


    );
  }
}