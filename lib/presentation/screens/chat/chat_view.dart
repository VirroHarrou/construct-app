import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatView extends ConsumerWidget {
  const ChatView({super.key});

  static const routeName = '/chats';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text('Чат'),
    );
  }
}
