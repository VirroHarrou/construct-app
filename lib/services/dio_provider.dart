import 'package:construct/domain/failures/api_failure.dart';
import 'package:construct/services/api_error_handler.dart';
import 'package:construct/services/auth_state_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:construct/services/token/token_storage_service.dart';

const String baseUrl = 'https://condstruct.ru';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 30),
    responseType: ResponseType.json,
  ));

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final token =
          await ref.read(tokenStorageServiceProvider).getAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    },
    onError: (DioException e, handler) async {
      if ([401, 403].contains(e.response?.statusCode)) {
        try {
          final newToken = await _refreshToken(ref);
          if (newToken != null) {
            e.requestOptions.headers['Authorization'] = 'Bearer $newToken';
            final response = await dio.fetch(e.requestOptions);
            return handler.resolve(response);
          } else {
            ref.read(authStateProvider.notifier).state =
                AuthState.sessionExpired;
          }
        } catch (_) {
          ref.read(authStateProvider.notifier).state =
              AuthState.unauthenticated;
        }
      }

      final failure = ApiErrorHandler.handleDioError(e);

      final updatedError = DioException(
        requestOptions: e.requestOptions,
        error: failure,
        response: e.response,
        type: DioExceptionType.badResponse,
        message: switch (failure) {
          ServerError(message: final msg) => msg ?? 'Server Error',
          ValidationErrors(errors: final errors) =>
            errors.isNotEmpty ? errors.first.msg : 'Validation Error',
          Unauthorized() => 'Unauthorized',
          Forbidden() => 'Forbidden',
          NotFound() => 'Not Found',
          NetworkError() => 'Network Error',
          Conflict() => 'Conflict',
          Other(message: final msg) => msg ?? 'Unknown Error',
        },
      );

      return handler.reject(updatedError);
    },
  ));

  return dio;
});

Future<String?> _refreshToken(Ref ref) async {
  final storage = ref.read(tokenStorageServiceProvider);
  final refreshToken = await storage.getRefreshToken();
  if (refreshToken == null) return null;
  final tempDio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 5),
    responseType: ResponseType.json,
  ));

  try {
    final response = await tempDio.post(
      '/auth/refresh',
      options: Options(headers: {'Refresh-Token': refreshToken}),
    );
    final tokens = response.data as Map<String, dynamic>;
    await storage.saveTokens(tokens['access_token'], tokens['refresh_token']);
    return tokens['access_token'];
  } catch (_) {
    await storage.clearTokens();
    return null;
  }
}
