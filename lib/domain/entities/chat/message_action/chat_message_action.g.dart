// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageAction _$ChatMessageActionFromJson(Map<String, dynamic> json) =>
    _ChatMessageAction(
      action: json['action'] as String,
      messageId: json['messageId'] as String?,
      content: json['content'] as String?,
      recipientId: json['recipientId'] as String?,
    );

Map<String, dynamic> _$ChatMessageActionToJson(_ChatMessageAction instance) =>
    <String, dynamic>{
      'action': instance.action,
      'messageId': instance.messageId,
      'content': instance.content,
      'recipientId': instance.recipientId,
    };
