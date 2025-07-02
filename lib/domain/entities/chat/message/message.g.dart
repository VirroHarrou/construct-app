// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageResponse _$ChatMessageResponseFromJson(Map<String, dynamic> json) =>
    _ChatMessageResponse(
      id: json['id'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isEdited: json['is_edited'] as bool,
      isDeleted: json['is_deleted'] as bool,
      senderId: json['sender_id'] as String,
      recipientId: json['recipient_id'] as String,
    );

Map<String, dynamic> _$ChatMessageResponseToJson(
        _ChatMessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_edited': instance.isEdited,
      'is_deleted': instance.isDeleted,
      'sender_id': instance.senderId,
      'recipient_id': instance.recipientId,
    };
