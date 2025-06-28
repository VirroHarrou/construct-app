import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_action.freezed.dart';
part 'chat_message_action.g.dart';

@freezed
sealed class ChatMessageAction with _$ChatMessageAction {
  const factory ChatMessageAction({
    required String action,
    String? messageId,
    String? content,
    String? recipientId,
  }) = _ChatMessageAction;

  factory ChatMessageAction.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageActionFromJson(json);

  factory ChatMessageAction.send({
    required String content,
    required String recipientId,
  }) =>
      ChatMessageAction(
        action: 'send',
        content: content,
        recipientId: recipientId,
      );

  factory ChatMessageAction.edit({
    required String messageId,
    required String content,
  }) =>
      ChatMessageAction(
        action: 'edit',
        messageId: messageId,
        content: content,
      );

  factory ChatMessageAction.delete({
    required String messageId,
  }) =>
      ChatMessageAction(
        action: 'delete',
        messageId: messageId,
      );
}
