// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessageAction {
  String get action;
  @JsonKey(name: 'message_id')
  String? get messageId;
  String? get content;
  @JsonKey(name: 'recipient_id')
  String? get recipientId;

  /// Serializes this ChatMessageAction to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatMessageAction &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, action, messageId, content, recipientId);

  @override
  String toString() {
    return 'ChatMessageAction(action: $action, messageId: $messageId, content: $content, recipientId: $recipientId)';
  }
}

/// @nodoc
@JsonSerializable()
class _ChatMessageAction implements ChatMessageAction {
  const _ChatMessageAction(
      {required this.action,
      @JsonKey(name: 'message_id') this.messageId,
      this.content,
      @JsonKey(name: 'recipient_id') this.recipientId});
  factory _ChatMessageAction.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageActionFromJson(json);

  @override
  final String action;
  @override
  @JsonKey(name: 'message_id')
  final String? messageId;
  @override
  final String? content;
  @override
  @JsonKey(name: 'recipient_id')
  final String? recipientId;

  @override
  Map<String, dynamic> toJson() {
    return _$ChatMessageActionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessageAction &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, action, messageId, content, recipientId);

  @override
  String toString() {
    return 'ChatMessageAction(action: $action, messageId: $messageId, content: $content, recipientId: $recipientId)';
  }
}

// dart format on
