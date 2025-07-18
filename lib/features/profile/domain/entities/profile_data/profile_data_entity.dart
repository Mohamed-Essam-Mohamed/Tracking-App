class ProfileDataEntity {
  const ProfileDataEntity({this.message = '', this.driver = const DriverEntity()});
  final String message;
  final DriverEntity driver;
}

class DriverEntity {
  const DriverEntity({
    this.role = '',
    this.sId = '',
    this.country = '',
    this.firstName = '',
    this.lastName = '',
    this.vehicleType = '',
    this.vehicleNumber = '',
    this.vehicleLicense = '',
    this.nID = '',
    this.nIDImg = '',
    this.email = '',
    this.gender = '',
    this.phone = '',
    this.photo = '',
    this.createdAt = '',
  });
  final String role;
  final String sId;
  final String country;
  final String firstName;
  final String lastName;
  final String vehicleType;
  final String vehicleNumber;
  final String vehicleLicense;
  final String nID;
  final String nIDImg;
  final String email;
  final String gender;
  final String phone;
  final String photo;
  final String createdAt;
}
