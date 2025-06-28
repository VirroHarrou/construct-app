// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageResponse _$ChatMessageResponseFromJson(Map<String, dynamic> json) =>
    _ChatMessageResponse(
      id: json['id'] as String,
      content: json['message'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isEdited: json['isEdited'] as bool,
      isDeleted: json['isDeleted'] as bool,
      senderId: json['senderId'] as String,
      recipientId: json['recipientId'] as String,
    );

Map<String, dynamic> _$ChatMessageResponseToJson(
        _ChatMessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isEdited': instance.isEdited,
      'isDeleted': instance.isDeleted,
      'senderId': instance.senderId,
      'recipientId': instance.recipientId,
    };
