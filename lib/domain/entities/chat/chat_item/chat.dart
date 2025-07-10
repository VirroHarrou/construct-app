// ignore_for_file: invalid_annotation_target

import 'package:construct/domain/entities/chat/message/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
sealed class Chat with _$Chat {
  const factory Chat({
    required String id,
    required String username,
    @JsonKey(name: 'last_message') required ChatMessageResponse lastMessage,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
