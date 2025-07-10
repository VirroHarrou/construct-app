// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chat _$ChatFromJson(Map<String, dynamic> json) => _Chat(
      id: json['id'] as String,
      username: json['username'] as String,
      lastMessage: ChatMessageResponse.fromJson(
          json['last_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatToJson(_Chat instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'last_message': instance.lastMessage,
    };
