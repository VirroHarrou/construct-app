// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
sealed class Chat with _$Chat {
  const factory Chat({
    required String id,
    @JsonKey(name: 'last_message') required String content,
    @JsonKey(name: 'last_message_at') required DateTime createdAt,
    required String username,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
