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
  String get content;
  int get rating;
  @JsonKey(name: 'recepient_id')
  String get recepientId;
  @JsonKey(name: 'sender_id')
  String get senderId;
  @JsonKey(name: 'created_at')
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
            (identical(other.content, content) || other.content == content) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.recepientId, recepientId) ||
                other.recepientId == recepientId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, rating, recepientId,
      senderId, createdAt, order);

  @override
  String toString() {
    return 'Review(id: $id, content: $content, rating: $rating, recepientId: $recepientId, senderId: $senderId, createdAt: $createdAt, order: $order)';
  }
}

/// @nodoc
@JsonSerializable()
class _Review implements Review {
  _Review(
      {required this.id,
      required this.content,
      required this.rating,
      @JsonKey(name: 'recepient_id') required this.recepientId,
      @JsonKey(name: 'sender_id') required this.senderId,
      @JsonKey(name: 'created_at') required this.createdAt,
      this.order});
  factory _Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final int rating;
  @override
  @JsonKey(name: 'recepient_id')
  final String recepientId;
  @override
  @JsonKey(name: 'sender_id')
  final String senderId;
  @override
  @JsonKey(name: 'created_at')
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
            (identical(other.content, content) || other.content == content) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.recepientId, recepientId) ||
                other.recepientId == recepientId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, rating, recepientId,
      senderId, createdAt, order);

  @override
  String toString() {
    return 'Review(id: $id, content: $content, rating: $rating, recepientId: $recepientId, senderId: $senderId, createdAt: $createdAt, order: $order)';
  }
}

/// @nodoc
mixin _$ReviewCreate {
  String get content;
  int get rating;
  @JsonKey(name: 'recepient_id')
  String get recepientId;

  /// Serializes this ReviewCreate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewCreate &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.recepientId, recepientId) ||
                other.recepientId == recepientId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content, rating, recepientId);

  @override
  String toString() {
    return 'ReviewCreate(content: $content, rating: $rating, recepientId: $recepientId)';
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewCreate implements ReviewCreate {
  _ReviewCreate(
      {required this.content,
      required this.rating,
      @JsonKey(name: 'recepient_id') required this.recepientId});
  factory _ReviewCreate.fromJson(Map<String, dynamic> json) =>
      _$ReviewCreateFromJson(json);

  @override
  final String content;
  @override
  final int rating;
  @override
  @JsonKey(name: 'recepient_id')
  final String recepientId;

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
            (identical(other.content, content) || other.content == content) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.recepientId, recepientId) ||
                other.recepientId == recepientId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content, rating, recepientId);

  @override
  String toString() {
    return 'ReviewCreate(content: $content, rating: $rating, recepientId: $recepientId)';
  }
}

// dart format on
