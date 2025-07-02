import 'package:construct/core/utils/compare_time.dart';
import 'package:construct/domain/entities/chat/chat_item/chat.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/presentation/screens/chat/chat_detail_view.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatItem extends ConsumerWidget {
  final Chat message;

  const ChatItem({super.key, required this.message});

  Future<User> getSender(WidgetRef ref) async {
    final res = await ref.read(userServiceProvider).getUser(message.id);
    return res;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                getComparedTime(message.createdAt),
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
            builder: (context, snapshot) {
              return InkWell(
                onTap: () {
                  if (snapshot.hasData) {
                    Navigator.of(context).pushNamed(
                      ChatDetailView.routeName,
                      arguments: snapshot.requireData,
                    );
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
                                snapshot.data?.fio ??
                                    'Неизвестный пользователь',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        message.content,
                        style: TextStyle(fontSize: 12),
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
