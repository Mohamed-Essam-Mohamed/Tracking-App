import 'package:json_annotation/json_annotation.dart';

class DriverDataEntity {
  DriverDataEntity({
    this.message,
    this.driver,});

  String? message;
  DriverEntity? driver;


}



class DriverEntity {
  DriverEntity({
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


}