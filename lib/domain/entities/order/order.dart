// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
sealed class Order with _$Order {
  factory Order({
    required String id,
    required String title,
    String? description,
    String? imageUrl,
    String? status,
    required double price,
    required String address,
    @JsonKey(name: 'begin_time') required DateTime beginTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
    @JsonKey(name: 'user_id') required String userId,
    @Default(0) int viewed,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
sealed class OrderCreate with _$OrderCreate {
  factory OrderCreate({
    required String title,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    required double price,
    required String address,
    @JsonKey(name: 'begin_time') required DateTime beginTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
  }) = _OrderCreate;

  factory OrderCreate.fromJson(Map<String, dynamic> json) =>
      _$OrderCreateFromJson(json);
}

@freezed
sealed class OrderUpdate with _$OrderUpdate {
  factory OrderUpdate({
    String? title,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    double? price,
    String? address,
    @JsonKey(name: 'begin_time') DateTime? beginTime,
    @JsonKey(name: 'end_time') DateTime? endTime,
  }) = _OrderUpdate;

  factory OrderUpdate.fromJson(Map<String, dynamic> json) =>
      _$OrderUpdateFromJson(json);
}
