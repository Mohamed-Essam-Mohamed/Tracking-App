import '../../domain/entities/apply_entity.dart';

/// message : "success"
/// driver : {"country":"Egypt","firstName":"amira","lastName":"khaled","vehicleType":"676b31a45d05310ca82657ac","vehicleNumber":"12221","vehicleLicense":"440814bb-df80-43ff-9824-1d5ea0a0dc1a-45.JPG","NID":"12345678912345","NIDImg":"6ca28ffe-6a70-455a-a3cc-83cb4fb26e43-45.JPG","email":"amira321@gmail.com","gender":"male","phone":"+201010700888","photo":"default-profile.png","role":"driver","_id":"681a5d801433a666c8d9ddd0","createdAt":"2025-05-06T19:05:36.750Z"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2ODFhNWQ4MDE0MzNhNjY2YzhkOWRkZDAiLCJpYXQiOjE3NDY1NTgzMzZ9.yGzatGSjXl03334yv56trdYYjc8E4gpPMkqOfDKtnrQ"

class ApplyModelDto {
  ApplyModelDto({
      this.message, 
      this.driver, 
      this.token,});

  ApplyModelDto.fromJson(dynamic json) {
    message = json['message'];
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    token = json['token'];
  }
  String? message;
  Driver? driver;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (driver != null) {
      map['driver'] = driver?.toJson();
    }
    map['token'] = token;
    return map;
  }

  ApplyEntity toEntity(){
    return ApplyEntity(message: message, driver:driver!.toEntity() , token: token);
  }

}

/// country : "Egypt"
/// firstName : "amira"
/// lastName : "khaled"
/// vehicleType : "676b31a45d05310ca82657ac"
/// vehicleNumber : "12221"
/// vehicleLicense : "440814bb-df80-43ff-9824-1d5ea0a0dc1a-45.JPG"
/// NID : "12345678912345"
/// NIDImg : "6ca28ffe-6a70-455a-a3cc-83cb4fb26e43-45.JPG"
/// email : "amira321@gmail.com"
/// gender : "male"
/// phone : "+201010700888"
/// photo : "default-profile.png"
/// role : "driver"
/// _id : "681a5d801433a666c8d9ddd0"
/// createdAt : "2025-05-06T19:05:36.750Z"

class Driver {
  Driver({
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
      this.id, 
      this.createdAt,});

  Driver.fromJson(dynamic json) {
    country = json['country'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    vehicleType = json['vehicleType'];
    vehicleNumber = json['vehicleNumber'];
    vehicleLicense = json['vehicleLicense'];
    nid = json['NID'];
    nIDImg = json['NIDImg'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    role = json['role'];
    id = json['_id'];
    createdAt = json['createdAt'];
  }
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
  String? id;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['vehicleType'] = vehicleType;
    map['vehicleNumber'] = vehicleNumber;
    map['vehicleLicense'] = vehicleLicense;
    map['NID'] = nid;
    map['NIDImg'] = nIDImg;
    map['email'] = email;
    map['gender'] = gender;
    map['phone'] = phone;
    map['photo'] = photo;
    map['role'] = role;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    return map;
  }
  DriverEntity toEntity(){
    return DriverEntity(
        country: country, firstName: firstName, lastName: lastName,
        vehicleType: vehicleType, vehicleNumber: vehicleNumber,
        vehicleLicense: vehicleLicense, nid: nid, nIDImg: nIDImg,
        email: email, gender: gender, phone: phone, photo: photo,
        role: role, id: id, createdAt: createdAt
    );
  }


}