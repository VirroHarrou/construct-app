import 'package:construct/domain/entities/chat/message/message.dart';
import 'package:construct/domain/entities/chat/message_action/chat_message_action.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'chat_service.dart';

part 'chat_provider.g.dart';

// Автоматически сохраняемый список сообщений
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
}

// Провайдер обработки обновлений чата
@riverpod
class ChatController extends _$ChatController {
  @override
  FutureOr<void> build(String token) {
    // Инициализация обработки сообщений
    ref.listen(chatUpdateStreamProvider(token), (_, next) {
      next.whenData((message) => _handleMessage(message));
    });
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

// Поток обновлений чата
@riverpod
Stream<ChatMessageResponse> chatUpdateStream(Ref ref, String token) {
  final service = ref.watch(chatServiceProvider(token));
  return service.messageStream;
}
