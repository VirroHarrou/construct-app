import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:construct/domain/failures/api_failure.dart';
import 'package:intl/intl.dart';

final errorMessageProvider = Provider<ErrorMessageService>((ref) {
  return ErrorMessageService();
});

class ErrorMessageService {
  String getErrorMessage(dynamic error) {
    if (error is ApiFailure) {
      return switch (error) {
        ServerError() => error.message ?? Intl.message('Server error'),
        ValidationErrors() =>
          Intl.message('Validation error', args: error.errors),
        Unauthorized() => Intl.message('Authorization failed'),
        Forbidden() => Intl.message('Access denied'),
        NotFound() => Intl.message('Resource not found'),
        NetworkError() => Intl.message('Network error'),
        Conflict() => Intl.message('Data conflict'),
        Other() => error.message ?? Intl.message('Unknown error'),
      };
    }
    return error.toString();
  }

  // Для прямого доступа без контекста
  static String of(dynamic error) {
    return ErrorMessageService().getErrorMessage(error);
  }
}
