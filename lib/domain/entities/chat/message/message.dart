// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
sealed class ChatMessageResponse with _$ChatMessageResponse {
  const factory ChatMessageResponse({
    required String id,
    required String content,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @JsonKey(name: 'is_edited') required bool isEdited,
    @JsonKey(name: 'is_deleted') required bool isDeleted,
    @JsonKey(name: 'sender_id') required String senderId,
    @JsonKey(name: 'recipient_id') required String recipientId,
  }) = _ChatMessageResponse;

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseFromJson(json);
}
