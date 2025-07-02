import 'package:construct/domain/entities/chat/message/message.dart';
import 'package:construct/domain/entities/chat/message_action/chat_message_action.dart';
import 'package:construct/services/api/chat/chat_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'chat_service.dart';

part 'chat_provider.g.dart';

@riverpod
class ChatMessages extends _$ChatMessages {
  @override
  List<ChatMessageResponse> build() => [];

  void _addMessage(ChatMessageResponse message) {
    state = [...state, message];
  }

  void _updateMessage(ChatMessageResponse updatedMessage) {
    state = [
      for (final msg in state)
        if (msg.id == updatedMessage.id) updatedMessage else msg
    ];
  }

  void loadHistory(List<ChatMessageResponse> history) {
    state = history.map((item) => item).toList();
  }
}

@riverpod
class ChatController extends _$ChatController {
  @override
  FutureOr<void> build(String token, String partnerId) async {
    try {
      await _loadChatHistory(partnerId);
      ref.listen<AsyncValue<ChatMessageResponse>>(
        chatUpdateStreamProvider(token),
        (_, next) {
          next.when(
            data: _handleMessage,
            error: (error, trace) => print("Stream error: $error\n$trace"),
            loading: () {},
          );
        },
      );
    } catch (e) {
      print("Ошибка инициализации чата: $e");
    }
  }

  Future<void> _loadChatHistory(String partnerId) async {
    final chatApiService = ref.read(chatApiServiceProvider);
    final history = await chatApiService.getChatHistory(partnerId);
    ref.read(chatMessagesProvider.notifier).loadHistory(history);
  }

  void _handleMessage(ChatMessageResponse message) {
    final messagesNotifier = ref.read(chatMessagesProvider.notifier);

    if (message.isDeleted) {
      messagesNotifier._updateMessage(message);
    } else {
      final exists =
          ref.read(chatMessagesProvider).any((m) => m.id == message.id);
      exists
          ? messagesNotifier._updateMessage(message)
          : messagesNotifier._addMessage(message);
    }
  }

  void sendMessage(ChatMessageAction action) {
    final service = ref.read(chatServiceProvider(token));
    service.sendAction(action);
  }
}

@riverpod
Stream<ChatMessageResponse> chatUpdateStream(Ref ref, String token) {
  final service = ref.watch(chatServiceProvider(token));
  return service.messageStream;
}
