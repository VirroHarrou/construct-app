import 'package:construct/domain/entities/chat/message_action/chat_message_action.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/presentation/screens/chat/message/message_view.dart';
import 'package:construct/services/api/chat/chat_provider.dart';
import 'package:construct/services/token/token_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatDetailView extends ConsumerStatefulWidget {
  final User user;

  static const routeName = '/chats/detail';

  const ChatDetailView({super.key, required this.user});

  @override
  ConsumerState<ChatDetailView> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends ConsumerState<ChatDetailView> {
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  final tokenProvider = FutureProvider<String>((ref) async {
    return await ref.watch(tokenStorageServiceProvider).getAccessToken() ?? '';
  });

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      final token = ref.read(tokenProvider).value!;
      final action = ChatMessageAction.send(
        content: _messageController.text,
        recipientId: widget.user.id,
      );
      ref
          .read(chatControllerProvider(token, widget.user.id).notifier)
          .sendMessage(action);
      _messageController.clear();
    }
  }

  void _deleteMessage(String messageId) {
    final token = ref.read(tokenProvider).value!;
    final action = ChatMessageAction.delete(messageId: messageId);
    ref
        .read(chatControllerProvider(token, widget.user.id).notifier)
        .sendMessage(action);
  }

  void _updateMessage(String messageId) {
    final token = ref.read(tokenProvider).value!;
    if (_messageController.text.isNotEmpty) {
      final action = ChatMessageAction.edit(
        messageId: messageId,
        content: _messageController.text,
      );
      ref
          .read(chatControllerProvider(token, widget.user.id).notifier)
          .sendMessage(action);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final token = ref.watch(tokenProvider);
        return token.when(
          data: (validToken) {
            final chatController =
                ref.watch(chatControllerProvider(validToken, widget.user.id));
            final messages = ref.watch(chatMessagesProvider);
            final colorScheme = Theme.of(context).colorScheme;

            messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));

            return GestureDetector(
              onTap: () => _textFieldFocusNode.unfocus(),
              child: Scaffold(
                appBar: AppBar(
                  title: Text(widget.user.fio),
                  surfaceTintColor: colorScheme.surface,
                  shadowColor: Colors.black54,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ListView.builder(
                          reverse: true,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            final isMe = message.senderId != widget.user.id;
                            bool showTime = true;

                            if (index > 0) {
                              final timeDiff = message.createdAt
                                  .difference(messages[index - 1].createdAt);
                              if (message.senderId ==
                                      messages[index - 1].senderId &&
                                  timeDiff.abs() < Duration(hours: 1)) {
                                showTime = false;
                              }
                            }

                            return Padding(
                              padding:
                                  EdgeInsets.only(bottom: index != 0 ? 10 : 0),
                              child: Align(
                                alignment: isMe
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: MessageView(
                                  message,
                                  isMe: isMe,
                                  onLongPress: isMe
                                      ? (content) {
                                          /* Действия при долгом нажатии */
                                        }
                                      : null,
                                  showTime: showTime,
                                  header: !isMe
                                      ? Text(
                                          "${widget.user.fio.split(" ")[1]} ${widget.user.fio.split(" ")[0].characters.first}.",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      color: colorScheme.primaryContainer,
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 20),
                      child: Row(
                        spacing: 10,
                        children: [
                          Expanded(
                            child: TextField(
                              focusNode: _textFieldFocusNode,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: 'Написать сообщение...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: BorderSide(
                                    color: colorScheme.primary,
                                    width: 0.5,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: BorderSide(
                                    color: colorScheme.primary,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              maxLines: 5,
                              minLines: 1,
                              // onSubmitted: (_) => _sendMessage(),
                            ),
                          ),
                          IconButton.filled(
                            icon: Icon(
                              Icons.arrow_upward_outlined,
                            ),
                            onPressed: _sendMessage,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (e, _) => Text('Error'),
          loading: () => CircularProgressIndicator(),
        );
      },
    );
  }
}
