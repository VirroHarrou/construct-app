// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:construct/domain/entities/order/order.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
sealed class Review with _$Review {
  factory Review({
    required String id,
    required String content,
    required int rating,
    @JsonKey(name: 'recepient_id') required String recepientId,
    @JsonKey(name: 'sender_id') required String senderId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    Order? order, // Дополнительная информация о заказе
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
sealed class ReviewCreate with _$ReviewCreate {
  factory ReviewCreate({
    required String content,
    required int rating,
    @JsonKey(name: 'recepient_id') required String recepientId,
  }) = _ReviewCreate;

  factory ReviewCreate.fromJson(Map<String, dynamic> json) =>
      _$ReviewCreateFromJson(json);
}
