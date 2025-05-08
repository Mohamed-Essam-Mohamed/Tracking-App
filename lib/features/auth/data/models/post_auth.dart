import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

class PostAuth {
  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  File? vehicleLicense;
  String? NID;
  File? NIDImg;
  String? email;
  String? gender;
  String? phone;
  String? password;
  String? rePassword;

  PostAuth({
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.NID,
    this.NIDImg,
    this.email,
    this.gender,
    this.phone,
    this.password,
    this.rePassword,
  });

  Future<FormData> toFormData() async {
    final Map<String, dynamic> fields = {};

    void addIfNotEmpty(String key, String? value) {
      if (value != null && value.isNotEmpty) {
        fields[key] = value;
      }
    }

    addIfNotEmpty('country', country);
    addIfNotEmpty('firstName', firstName);
    addIfNotEmpty('lastName', lastName);
    addIfNotEmpty('vehicleType', vehicleType);
    addIfNotEmpty('vehicleNumber', vehicleNumber);
    addIfNotEmpty('NID', NID);
    addIfNotEmpty('email', email);
    addIfNotEmpty('gender', gender);
    addIfNotEmpty('phone', phone);
    addIfNotEmpty('password', password);
    addIfNotEmpty('rePassword', rePassword);

    final formData = FormData.fromMap(fields);

    if (vehicleLicense != null) {
      formData.files.add(MapEntry(
        'vehicleLicense',
        await MultipartFile.fromFile(
          vehicleLicense!.path,
          filename: basename(vehicleLicense!.path),
          contentType: MediaType('image', 'jpeg'), // غيرها حسب نوع الصورة
        ),
      ));
    }

    if (NIDImg != null) {
      formData.files.add(MapEntry(
        'NIDImg',
        await MultipartFile.fromFile(
          NIDImg!.path,
          filename: basename(NIDImg!.path),
          contentType: MediaType('image', 'jpeg'),
        ),
      ));
    }

    return formData;
  }
}
