import 'package:construct/domain/failures/api_failure.dart';
import 'package:construct/services/api_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:construct/services/api/api_service.dart';
import 'package:construct/services/token/token_storage_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AuthService(apiService, ref);
});

class AuthService {
  final ApiService _api;
  final Ref _ref;

  AuthService(this._api, this._ref);

  Future<Map<String, dynamic>> login(String phone, String password) async {
    try {
      final response = await _api.post(
        '/auth/token',
        queryParameters: {'phone': phone, 'password': password},
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  Future<void> logout() async {
    final storage = _ref.read(tokenStorageServiceProvider);
    final refreshToken = await storage.getRefreshToken();

    if (refreshToken != null) {
      try {
        await _api.post(
          '/auth/logout',
          options: Options(headers: {'Refresh-Token': refreshToken}),
        );
      } catch (_) {}
    }

    await storage.clearTokens();
  }

  ApiFailure _handleApiError(DioException e) {
    if (e.error is ApiFailure) return e.error as ApiFailure;
    return ApiErrorHandler.handleDioError(e);
  }
}
