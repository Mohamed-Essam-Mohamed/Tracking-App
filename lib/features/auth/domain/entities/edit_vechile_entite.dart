class EditVechileEntite {
  String? message;
  DriverEntity? driver;

  EditVechileEntite({this.message, this.driver});
}

class DriverEntity {
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleLicense;

  DriverEntity({
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
  });
}
