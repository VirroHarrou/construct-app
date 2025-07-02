import 'dart:convert';

import 'package:construct/domain/entities/chat/message/message.dart';
import 'package:construct/domain/entities/chat/message_action/chat_message_action.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_service.g.dart';

class ChatService {
  final WebSocketChannel channel;

  ChatService(this.channel);

  void sendAction(ChatMessageAction action) {
    final json = action.toJson();
    final jsonString = jsonEncode(json);
    channel.sink.add(jsonString);
  }

  Stream<ChatMessageResponse> get messageStream => channel.stream.map((data) {
        final json = jsonDecode(data);
        // print('${json.runtimeType} $json');
        // print(json['id']);
        return ChatMessageResponse.fromJson(json as Map<String, dynamic>);
      }).handleError((error) {
        print('WebSocket error: $error');
      });

  void close() {
    channel.sink.close();
  }
}

@riverpod
WebSocketChannel webSocketChannel(Ref ref, String token) {
  final uri = Uri.parse('wss://condstruct.ru/ws/chat?token=$token');
  final channel = WebSocketChannel.connect(uri);

  ref.onDispose(() {
    channel.sink.close();
  });

  return channel;
}

@riverpod
ChatService chatService(Ref ref, String token) {
  final channel = ref.watch(webSocketChannelProvider(token));
  return ChatService(channel);
}
