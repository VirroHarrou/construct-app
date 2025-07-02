import 'package:construct/presentation/screens/hello/hello_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider =
    StateProvider<AuthState>((ref) => AuthState.authenticated);

final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});

enum AuthState {
  authenticated,
  unauthenticated,
  sessionExpired,
}

class SessionExpiredHandler {
  final Ref ref;

  SessionExpiredHandler(this.ref);

  void handleSessionExpired() {
    ref.listen<AuthState>(authStateProvider, (_, state) {
      if (state == AuthState.sessionExpired ||
          state == AuthState.unauthenticated) {
        final navigatorKey = ref.read(navigatorKeyProvider);
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          HelloView.routeName,
          (route) => false,
        );
      }
    });
  }
}

final sessionExpiredHandlerProvider = Provider<SessionExpiredHandler>((ref) {
  return SessionExpiredHandler(ref);
});
