import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/failures/api_failure.dart';
import 'package:construct/services/api_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:construct/services/api/api_service.dart';

final orderServiceProvider = Provider<OrderService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return OrderService(apiService);
});

class OrderService {
  final ApiService _api;

  OrderService(this._api);

  // Получить все заказы
  Future<List<Order>> getAllOrders({int offset = 0, int limit = 20}) async {
    try {
      final response = await _api.get('/orders/?offset=0&limit=20');
      return (response.data as List).map((e) => Order.fromJson(e)).toList();
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  // Получить все связанные заказы
  Future<List<Order>> getConnected() async {
    try {
      final response = await _api.get('/orders/connected');
      return (response.data as List).map((e) => Order.fromJson(e)).toList();
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  // Создать заказ
  Future<Order> createOrder(OrderCreate orderCreate) async {
    try {
      final response = await _api.post(
        '/orders/',
        data: orderCreate.toJson(),
      );
      return Order.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  // Получить заказ по ID
  Future<Order> getOrder(String orderId) async {
    try {
      final response = await _api.get('/orders/$orderId');
      return Order.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  // Обновить заказ
  Future<Order> updateOrder(String orderId, OrderUpdate orderUpdate) async {
    try {
      final response = await _api.put(
        '/orders/$orderId',
        data: orderUpdate.toJson(),
      );
      return Order.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  // Удалить заказ
  Future<void> deleteOrder(String orderId) async {
    try {
      await _api.delete('/orders/$orderId');
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  Future<void> markOrderViewed(String orderId, {String? status}) async {
    try {
      await _api.post(
        '/orders/$orderId/view',
        data: {'status': status},
      );
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  Future<void> updateOrderStatus(String orderId,
      {String? status, String? userId}) async {
    try {
      await _api.put(
        '/orders/$orderId/status',
        data: {'status': status, 'user_id': userId},
      );
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  // Обработчик ошибок API
  ApiFailure _handleApiError(DioException e) {
    if (e.error is ApiFailure) return e.error as ApiFailure;
    return ApiErrorHandler.handleDioError(e);
  }
}
