import 'package:construct/core/utils/compare_time.dart';
import 'package:construct/domain/entities/chat/chat_item/chat.dart';
import 'package:construct/domain/entities/chat/message/message.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/generated/l10n.dart';
import 'package:construct/presentation/screens/chat/chat_detail_view.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatItem extends ConsumerStatefulWidget {
  final Chat chat;

  const ChatItem({super.key, required this.chat});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatItemState();
}

class _ChatItemState extends ConsumerState<ChatItem> {
  late Chat chat;

  Future<User> getSender(WidgetRef ref) async {
    final res = await ref.read(userServiceProvider).getUser(chat.id);
    return res;
  }

  @override
  void initState() {
    chat = widget.chat;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 4),
            ),
          ]),
      padding: EdgeInsets.all(18),
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: 12,
            children: [
              Text(
                getComparedTime(chat.lastMessage.createdAt, S.of(context)),
                style: TextStyle(
                  color: colorScheme.onSecondaryContainer,
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Icon(
                Icons.more_horiz,
                color: colorScheme.secondary,
              ),
            ],
          ),
          FutureBuilder<User>(
            future: getSender(ref),
            builder: (context, result) {
              return InkWell(
                onTap: () async {
                  if (result.hasData) {
                    final message = await Navigator.of(context).pushNamed(
                      ChatDetailView.routeName,
                      arguments: result.requireData,
                    );
                    if (message != null && message is ChatMessageResponse) {
                      setState(() => chat = Chat(
                            id: widget.chat.id,
                            username: widget.chat.username,
                            lastMessage: message,
                          ));
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEAF2FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: colorScheme.onSurfaceVariant,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 5,
                            children: [
                              Text(
                                result.data?.fio ?? 'Неизвестный пользователь',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            if (chat.lastMessage.senderId != result.data?.id)
                              TextSpan(
                                text: 'Вы: ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            TextSpan(
                              text: chat.lastMessage.content,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
