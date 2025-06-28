import 'package:construct/services/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Response> get(String path) async => dio.get(path);
  Future<Response> post(
    String path, {
    Object? data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async =>
      dio.post(
        path,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
  Future<Response> put(String path, {Object? data}) async =>
      dio.put(path, data: data);
  Future<Response> delete(String path) async => dio.delete(path);
}
