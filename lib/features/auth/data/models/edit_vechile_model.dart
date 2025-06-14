import 'package:tracking_app/features/auth/domain/entities/apply_entity.dart';

class EditVechileModel {
  EditVechileModel({
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
  });

  EditVechileModel.fromJson(dynamic json) {
    vehicleType = json['vehicleType'];
    vehicleNumber = json['vehicleNumber'];
    vehicleLicense = json['vehicleLicense'];
  }

  String? vehicleType;
  String? vehicleNumber;
  String? vehicleLicense;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vehicleType'] = vehicleType;
    map['vehicleNumber'] = vehicleNumber;
    map['vehicleLicense'] = vehicleLicense;
    return map;
  }

  DriverEntity toEntity() {
    return DriverEntity(
      vehicleType: vehicleType,
      vehicleNumber: vehicleNumber,
      vehicleLicense: vehicleLicense,
    );
  }
}
