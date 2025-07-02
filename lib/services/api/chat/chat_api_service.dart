import 'package:construct/domain/entities/chat/chat_item/chat.dart';
import 'package:construct/domain/entities/chat/message/message.dart';
import 'package:construct/domain/failures/api_failure.dart';
import 'package:construct/services/api/api_service.dart';
import 'package:construct/services/api_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatApiServiceProvider = Provider<ChatApiService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ChatApiService(apiService);
});

class ChatApiService {
  final ApiService _api;

  ChatApiService(this._api);

  Future<List<Chat>> getUserChats() async {
    try {
      final response = await _api.get('/chats/');
      return (response.data as List)
          .map((item) => Chat.fromJson(item))
          .toList();
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  Future<List<ChatMessageResponse>> getChatHistory(
    String partnerId, {
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final response = await _api.get(
        '/$partnerId/messages?limit=$limit&offset=$offset',
      );
      return (response.data as List)
          .map((item) => ChatMessageResponse.fromJson(item))
          .toList();
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  ApiFailure _handleApiError(DioException e) {
    if (e.error is ApiFailure) return e.error as ApiFailure;
    return ApiErrorHandler.handleDioError(e);
  }
}
