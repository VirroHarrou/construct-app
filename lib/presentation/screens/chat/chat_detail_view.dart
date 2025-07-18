import 'package:construct/domain/entities/chat/message/message.dart';
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
  ChatMessageResponse? _messageResponse;
  ChatMessageResponse? _editingMessage;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  final tokenProvider = FutureProvider<String>((ref) async {
    return await ref.watch(tokenStorageServiceProvider).getAccessToken() ?? '';
  });

  void _sendMessage() {
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

  void _messageTask() {
    if (_messageController.text.isNotEmpty) {
      if (_isEditing && _editingMessage != null) {
        _updateMessage(_editingMessage!.id);
        setState(() {
          _isEditing = false;
          _editingMessage = null;
        });
      } else {
        _sendMessage();
      }
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
    final action = ChatMessageAction.edit(
      messageId: messageId,
      content: _messageController.text,
    );
    ref
        .read(chatControllerProvider(token, widget.user.id).notifier)
        .sendMessage(action);
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final token = ref.watch(tokenProvider);
        return token.when(
          data: (validToken) {
            // ignore: unused_local_variable
            final chatController =
                ref.watch(chatControllerProvider(validToken, widget.user.id));
            final messages = ref.watch(chatMessagesProvider);
            final colorScheme = Theme.of(context).colorScheme;

            messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));
            if (messages.isNotEmpty) _messageResponse = messages.first;

            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    widget.user.fio,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  backgroundColor: colorScheme.primaryContainer,
                  surfaceTintColor: colorScheme.surface,
                  shadowColor: Colors.black54,
                  leading: IconButton(
                    onPressed: () =>
                        Navigator.of(context).pop(_messageResponse),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: colorScheme.primary,
                    ),
                  ),
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
                                      ? (message) => _showMessageActionMenu(
                                          context, message)
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
                    _buildInput(colorScheme),
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

  void _showMessageActionMenu(
      BuildContext context, ChatMessageResponse message) {
    final colorScheme = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Сообщение:',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: SelectableText(
                  message.content,
                  style: TextStyle(
                    color: colorScheme.secondary,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.edit, color: colorScheme.primary),
                title: const Text('Редактировать'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _isEditing = true;
                    _editingMessage = message;
                    _messageController.text = message.content;
                  });
                  // FocusScope.of(context).requestFocus(_focusNode);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red[600]),
                title: const Text('Удалить'),
                onTap: () {
                  Navigator.pop(context);
                  _deleteMessage(message.id);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Container _buildInput(ColorScheme colorScheme) {
    return Container(
      color: colorScheme.primaryContainer,
      padding: EdgeInsets.fromLTRB(20, 10, 10, 20),
      child: Row(
        spacing: 10,
        children: [
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _isEditing = false;
                  _editingMessage = null;
                  _messageController.clear();
                });
              },
            ),
          Expanded(
            child: TextField(
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
            ),
          ),
          IconButton.filled(
            icon: Icon(_isEditing ? Icons.check : Icons.arrow_upward_outlined),
            onPressed: _messageTask,
          ),
        ],
      ),
    );
  }
}
