import 'package:construct/domain/failures/api_failure.dart';

String mapApiFailureToMessage(ApiFailure failure) {
  return switch (failure) {
    ServerError(message: final msg) => msg ?? 'Ошибка сервера',
    ValidationErrors(errors: final errors) =>
      errors.isNotEmpty ? errors.first.msg : 'Ошибка валидации',
    Unauthorized() => 'Требуется авторизация',
    Forbidden() => 'Доступ запрещен',
    NotFound() => 'Ресурс не найден',
    NetworkError() => 'Ошибка сети',
    Conflict() => 'Конфликт данных',
    Other(message: final msg) => msg ?? 'Неизвестная ошибка',
  };
}
