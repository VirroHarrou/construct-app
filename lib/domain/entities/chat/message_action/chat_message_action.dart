// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_action.freezed.dart';
part 'chat_message_action.g.dart';

@freezed
sealed class ChatMessageAction with _$ChatMessageAction {
  const factory ChatMessageAction({
    required String action,
    @JsonKey(name: 'message_id') String? messageId,
    String? content,
    @JsonKey(name: 'recipient_id') String? recipientId,
  }) = _ChatMessageAction;

  factory ChatMessageAction.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageActionFromJson(json);

  factory ChatMessageAction.send({
    required String content,
    @JsonKey(name: 'recipient_id') required String recipientId,
  }) =>
      ChatMessageAction(
        action: 'send',
        content: content,
        recipientId: recipientId,
      );

  factory ChatMessageAction.edit({
    @JsonKey(name: 'message_id') required String messageId,
    required String content,
  }) =>
      ChatMessageAction(
        action: 'edit',
        messageId: messageId,
        content: content,
      );

  factory ChatMessageAction.delete({
    @JsonKey(name: 'message_id') required String messageId,
  }) =>
      ChatMessageAction(
        action: 'delete',
        messageId: messageId,
      );
}
