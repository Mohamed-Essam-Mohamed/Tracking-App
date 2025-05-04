import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:retry/retry.dart';

import '../../../generated/locale_keys.g.dart';
import '../common/api_result.dart';
import 'app_exception.dart';

@singleton
class ApiManager {
  final Logger _logger = Logger();

  Future<Result<T>> execute<T>(Future<T> Function() apiCall) async {
    try {
      final response = await retry(
        apiCall,
        maxAttempts: 3,
        retryIf: (e) =>
            e is SocketException ||
            (
              e is DioException &&
                  (e.type == DioExceptionType.connectionTimeout ||
                      e.type == DioExceptionType.receiveTimeout),
            ),
      );
      return SuccessResult<T>(response);
    } on SocketException {
      _logger.e('No internet connection');
      return FailureResult<T>(
        InternetConnectionException(message: LocaleKeys.Error_NoInternetConnection.tr()),
      );
    } on DioException catch (e) {
      _logger.e('DioException: ${e.message}', e);
      return _handleDioException<T>(e);
    } on FormatException {
      _logger.e('Data parsing error');
      return FailureResult<T>(
        DataParsingException(message: LocaleKeys.Error_DataParsingException.tr()),
      );
    } catch (e) {
      _logger.e('Unexpected error: $e');
      return FailureResult<T>(
        UnknownApiException(message: LocaleKeys.Error_Unexpected_error.tr()),
      );
    }
  }

  Result<T> _handleDioException<T>(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return FailureResult<T>(
          ApiTimeoutException(message: _getTimeoutMessage(e.type)),
        );
      case DioExceptionType.badCertificate:
        return FailureResult<T>(
          CertificateException(message: LocaleKeys.Error_Invalid_certificate.tr()),
        );
      case DioExceptionType.badResponse:
        if (e.response == null) {
          return FailureResult<T>(UnknownApiException(
              message: LocaleKeys.Error_Unexpected_server_error.tr()));
        }
        return _handleBadResponse<T>(e.response!);
      case DioExceptionType.cancel:
        return FailureResult<T>(
          RequestCancelledException(message: LocaleKeys.Error_Request_cancelled.tr()),
        );
      case DioExceptionType.connectionError:
        return FailureResult<T>(
          InternetConnectionException(message: LocaleKeys.Error_Connection_failed.tr()),
        );
      case DioExceptionType.unknown:
        return FailureResult<T>(
          UnknownApiException(
              message: e.message ?? LocaleKeys.Error_Unexpected_error.tr()),
        );
    }
  }

  Result<T> _handleBadResponse<T>(Response response) {
    final statusCode = response.statusCode ?? 500;
    final errorMessage = _extractErrorMessage(response.data);
    final url = response.requestOptions.uri.toString(); // لإضافة الـ URL في الرسالة

    switch (statusCode) {
      case 400:
        return FailureResult<T>(
          BadRequestException(message: errorMessage, statusCode: statusCode, url: url),
        );
      case 401:
        return FailureResult<T>(
          UnauthorizedException(message: errorMessage, statusCode: statusCode, url: url),
        );
      case 403:
        return FailureResult<T>(
          ForbiddenException(message: errorMessage, statusCode: statusCode, url: url),
        );
      case 404:
        return FailureResult<T>(
          NotFoundException(message: errorMessage, statusCode: statusCode, url: url),
        );
      case 408:
        return FailureResult<T>(
          RequestTimeoutException(
              message: errorMessage, statusCode: statusCode, url: url),
        );
      case 429:
        return FailureResult<T>(
          TooManyRequestsException(
              message: errorMessage, statusCode: statusCode, url: url),
        );
      case 500:
        return FailureResult<T>(
          InternalServerErrorException(
              message: errorMessage, statusCode: statusCode, url: url),
        );
      case 502:
        return FailureResult<T>(
          BadGatewayException(message: errorMessage, statusCode: statusCode, url: url),
        );
      case 503:
        return FailureResult<T>(
          ServiceUnavailableException(
              message: errorMessage, statusCode: statusCode, url: url),
        );
      case 504:
        return FailureResult<T>(
          GatewayTimeoutException(
              message: errorMessage, statusCode: statusCode, url: url),
        );
      default:
        return FailureResult<T>(
          UnknownApiException(
              message: 'Unexpected error: $statusCode - $errorMessage (URL: $url)'),
        );
    }
  }

  String _extractErrorMessage(dynamic data) {
    if (data == null) {
      return LocaleKeys.Error_Unexpected_server_error.tr();
    }
    if (data is String) {
      return data; // لو الخطأ نص مباشر
    }
    if (data is Map<String, dynamic>) {
      // جرب مفاتيح شائعة للأخطاء
      for (var key in ['error', 'message', 'error_message', 'detail']) {
        if (data.containsKey(key)) {
          return data[key].toString();
        }
      }
    }
    if (data is List && data.isNotEmpty) {
      // لو الخطأ جاي كقائمة، اجمع الرسائل
      return data.map((e) => e.toString()).join(', ');
    }
    return data.toString(); // أي صيغة تانية، حولها لنص
  }

  String _getTimeoutMessage(DioExceptionType type) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return LocaleKeys.Error_Connection_timeout.tr();
      case DioExceptionType.sendTimeout:
        return LocaleKeys.Error_Send_timeout.tr();
      case DioExceptionType.receiveTimeout:
        return LocaleKeys.Error_Receive_timeout.tr();
      default:
        return LocaleKeys.Error_Timeout_occurred.tr();
    }
  }
}
