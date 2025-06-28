import 'package:construct/core/utils/compare_time.dart';
import 'package:construct/domain/entities/chat/message/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatItem extends ConsumerWidget {
  final ChatMessageResponse message;

  const ChatItem({super.key, required this.message});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colorScheme.primaryContainer,
      ),
      padding: EdgeInsets.all(18),
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: 12,
            children: [
              Text(getComparedTime(message.createdAt)),
              Spacer(),
              Icon(
                Icons.more_horiz,
                color: colorScheme.secondary,
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFEAF2FF),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message.content),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
