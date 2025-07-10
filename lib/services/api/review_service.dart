import 'package:construct/domain/entities/review/review.dart';
import 'package:construct/domain/failures/api_failure.dart';
import 'package:construct/services/api_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:construct/services/api/api_service.dart';

final reviewServiceProvider = Provider<ReviewService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ReviewService(apiService);
});

class ReviewService {
  final ApiService _api;

  ReviewService(this._api);

  // Создать отзыв
  Future<Review> createReview(ReviewCreate reviewCreate) async {
    try {
      final response = await _api.post(
        '/reviews/',
        data: reviewCreate.toJson(),
      );
      return Review.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  // Получить отзывы для заказа
  Future<List<Review>> getRecepientReviews(String userId) async {
    try {
      final response = await _api.get('/reviews/$userId');
      return (response.data as List).map((e) => Review.fromJson(e)).toList();
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  // Удалить отзыв
  Future<void> deleteReview(String reviewId) async {
    try {
      await _api.delete('/reviews/$reviewId');
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
