// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
sealed class ChatMessageResponse with _$ChatMessageResponse {
  const factory ChatMessageResponse({
    required String id,
    @JsonKey(name: 'message') required String content,
    required DateTime createdAt,
    required DateTime? updatedAt,
    required bool isEdited,
    required bool isDeleted,
    required String senderId,
    required String recipientId,
  }) = _ChatMessageResponse;

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseFromJson(json);
}
