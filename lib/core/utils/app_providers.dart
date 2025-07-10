import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/services/api/api_service.dart';
import 'package:construct/services/api/review_service.dart';
import 'package:construct/services/auth_state_provider.dart';
import 'package:construct/services/dio_provider.dart';
import 'package:construct/services/token/token_storage_service.dart';
import 'package:construct/services/api/auth_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final providers = [
  dioProvider,
  tokenStorageServiceProvider,
  apiServiceProvider,
  authServiceProvider,
  userServiceProvider,
  orderServiceProvider,
  reviewServiceProvider,
  authStateProvider,
  currentUserProvider,
];

final currentUserProvider = FutureProvider.autoDispose<User?>((ref) async {
  final authState = ref.watch(authStateProvider);

  ref.onDispose(() {});

  if (authState == AuthState.authenticated) {
    final userService = ref.read(userServiceProvider);
    return userService.getMe();
  }
  return null;
});
