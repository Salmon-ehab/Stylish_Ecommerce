import 'package:dio/dio.dart';

class AppException implements Exception {
  final String message;

  AppException(this.message);

  factory AppException.fromDio(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return AppException("انتهت مهلة الاتصال بالخادم.");
      case DioExceptionType.sendTimeout:
        return AppException("انتهت مهلة إرسال البيانات.");
      case DioExceptionType.receiveTimeout:
        return AppException("انتهت مهلة استلام البيانات.");
      case DioExceptionType.badCertificate:
        return AppException("شهادة SSL غير موثوقة.");
      case DioExceptionType.badResponse:
        return _handleBadResponse(dioError);
      case DioExceptionType.cancel:
        return AppException("تم إلغاء الطلب.");
      case DioExceptionType.connectionError:
        return AppException("لا يوجد اتصال بالإنترنت.");
      case DioExceptionType.unknown:
      default:
        return AppException("حدث خطأ غير متوقع.");
    }
  }

  static AppException _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    switch (statusCode) {
      case 400:
        return AppException("طلب غير صالح.");
      case 401:
        return AppException("غير مصرح لك.");
      case 403:
        return AppException("تم رفض الوصول.");
      case 404:
        return AppException("العنصر غير موجود.");
      case 500:
        return AppException("خطأ داخلي في الخادم.");
      default:
        return AppException("خطأ غير معروف: ${statusCode ?? '؟؟'}.");
    }
  }

  @override
  String toString() => message;
}
