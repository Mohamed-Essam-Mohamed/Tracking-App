import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/utils/app_shared_preference.dart';
@lazySingleton
class UploadPhotoApiService {
  final Dio _dio;

  UploadPhotoApiService(this._dio);
  Future<String> uploadPhoto(File image) async {
    final token = await SharedPreferencesUtils.getString("token");
    if (token == null) {
      throw Exception("Token is not available");
    }

    FormData formData = FormData.fromMap({
      "photo": await MultipartFile.fromFile(
          contentType: DioMediaType('image', 'jpeg'),
          image.path, filename: image.uri.pathSegments.last),
    });

    final response = await _dio.put(
      'https://flower.elevateegy.com/api/v1/drivers/upload-photo',
      data: formData,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    return response.data['message'];
  }}
