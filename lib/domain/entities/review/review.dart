import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:construct/domain/entities/order/order.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
sealed class Review with _$Review {
  factory Review({
    required String id,
    required String text,
    required int rating,
    required String orderId,
    required String userId,
    required DateTime createdAt,
    Order? order, // Дополнительная информация о заказе
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
sealed class ReviewCreate with _$ReviewCreate {
  factory ReviewCreate({
    required String text,
    required int rating,
    required String orderId,
  }) = _ReviewCreate;

  factory ReviewCreate.fromJson(Map<String, dynamic> json) =>
      _$ReviewCreateFromJson(json);
}
