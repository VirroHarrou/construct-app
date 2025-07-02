// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chat _$ChatFromJson(Map<String, dynamic> json) => _Chat(
      id: json['id'] as String,
      content: json['last_message'] as String,
      createdAt: DateTime.parse(json['last_message_at'] as String),
      username: json['username'] as String,
    );

Map<String, dynamic> _$ChatToJson(_Chat instance) => <String, dynamic>{
      'id': instance.id,
      'last_message': instance.content,
      'last_message_at': instance.createdAt.toIso8601String(),
      'username': instance.username,
    };
