// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessageResponse {
  String get id;
  @JsonKey(name: 'message')
  String get content;
  DateTime get createdAt;
  DateTime? get updatedAt;
  bool get isEdited;
  bool get isDeleted;
  String get senderId;
  String get recipientId;

  /// Serializes this ChatMessageResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatMessageResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isEdited, isEdited) ||
                other.isEdited == isEdited) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, createdAt,
      updatedAt, isEdited, isDeleted, senderId, recipientId);

  @override
  String toString() {
    return 'ChatMessageResponse(id: $id, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, isEdited: $isEdited, isDeleted: $isDeleted, senderId: $senderId, recipientId: $recipientId)';
  }
}

/// @nodoc
@JsonSerializable()
class _ChatMessageResponse implements ChatMessageResponse {
  const _ChatMessageResponse(
      {required this.id,
      @JsonKey(name: 'message') required this.content,
      required this.createdAt,
      required this.updatedAt,
      required this.isEdited,
      required this.isDeleted,
      required this.senderId,
      required this.recipientId});
  factory _ChatMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'message')
  final String content;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool isEdited;
  @override
  final bool isDeleted;
  @override
  final String senderId;
  @override
  final String recipientId;

  @override
  Map<String, dynamic> toJson() {
    return _$ChatMessageResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessageResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isEdited, isEdited) ||
                other.isEdited == isEdited) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, createdAt,
      updatedAt, isEdited, isDeleted, senderId, recipientId);

  @override
  String toString() {
    return 'ChatMessageResponse(id: $id, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, isEdited: $isEdited, isDeleted: $isDeleted, senderId: $senderId, recipientId: $recipientId)';
  }
}

// dart format on
