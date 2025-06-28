// api_error_handler.dart
import 'package:construct/domain/failures/api_failure.dart';
import 'package:dio/dio.dart';

class ApiErrorHandler {
  static ApiFailure handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return const ApiFailure.networkError();
    }

    final statusCode = e.response?.statusCode;
    final data = e.response?.data;

    switch (statusCode) {
      case 400:
        return const ApiFailure.other('Bad Request');
      case 401:
        return const ApiFailure.unauthorized();
      case 403:
        return const ApiFailure.forbidden();
      case 404:
        return const ApiFailure.notFound();
      case 409:
        return const ApiFailure.conflict();
      case 422:
        try {
          final errors = (data['detail'] as List)
              .map((e) => ValidationErrorDetail.fromJson(e))
              .toList();
          return ApiFailure.validationErrors(errors);
        } catch (_) {
          return const ApiFailure.other('Validation Error');
        }
      case 500:
        return const ApiFailure.serverError();
      default:
        return ApiFailure.other(e.message);
    }
  }
}
