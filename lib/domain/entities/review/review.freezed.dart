// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Review {
  String get id;
  String get text;
  int get rating;
  String get orderId;
  String get userId;
  DateTime get createdAt;
  Order? get order;

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Review &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, text, rating, orderId, userId, createdAt, order);

  @override
  String toString() {
    return 'Review(id: $id, text: $text, rating: $rating, orderId: $orderId, userId: $userId, createdAt: $createdAt, order: $order)';
  }
}

/// @nodoc
@JsonSerializable()
class _Review implements Review {
  _Review(
      {required this.id,
      required this.text,
      required this.rating,
      required this.orderId,
      required this.userId,
      required this.createdAt,
      this.order});
  factory _Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final int rating;
  @override
  final String orderId;
  @override
  final String userId;
  @override
  final DateTime createdAt;
  @override
  final Order? order;

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Review &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, text, rating, orderId, userId, createdAt, order);

  @override
  String toString() {
    return 'Review(id: $id, text: $text, rating: $rating, orderId: $orderId, userId: $userId, createdAt: $createdAt, order: $order)';
  }
}

/// @nodoc
mixin _$ReviewCreate {
  String get text;
  int get rating;
  String get orderId;

  /// Serializes this ReviewCreate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewCreate &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, rating, orderId);

  @override
  String toString() {
    return 'ReviewCreate(text: $text, rating: $rating, orderId: $orderId)';
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewCreate implements ReviewCreate {
  _ReviewCreate(
      {required this.text, required this.rating, required this.orderId});
  factory _ReviewCreate.fromJson(Map<String, dynamic> json) =>
      _$ReviewCreateFromJson(json);

  @override
  final String text;
  @override
  final int rating;
  @override
  final String orderId;

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewCreateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewCreate &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, rating, orderId);

  @override
  String toString() {
    return 'ReviewCreate(text: $text, rating: $rating, orderId: $orderId)';
  }
}

// dart format on
