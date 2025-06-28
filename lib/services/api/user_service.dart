import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/domain/failures/api_failure.dart';
import 'package:construct/services/api_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:construct/services/api/api_service.dart';

final userServiceProvider = Provider<UserService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return UserService(apiService);
});

class UserService {
  final ApiService _api;

  UserService(this._api);

  Future<User> getMe() async {
    try {
      final response = await _api.get('/users/');
      return User.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  Future<User> getUser(String userId) async {
    try {
      final response = await _api.get('/users/$userId');
      return User.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  Future<User> createUser(UserCreate userCreate) async {
    try {
      final response = await _api.post(
        '/users/',
        data: userCreate.toJson(),
      );
      return User.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  Future<User> updateUser(UserUpdate userUpdate) async {
    try {
      final response = await _api.put(
        '/users/',
        data: userUpdate.toJson(),
      );
      return User.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  Future<void> deleteUser() async {
    try {
      await _api.delete('/users/');
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  // user_service.dart
  ApiFailure _handleApiError(DioException e) {
    if (e.error is ApiFailure) return e.error as ApiFailure;
    return ApiErrorHandler.handleDioError(e);
  }
}
