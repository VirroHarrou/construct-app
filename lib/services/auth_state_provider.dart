import 'package:construct/presentation/screens/hello/hello_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider =
    StateProvider<AuthState>((ref) => AuthState.authenticated);

enum AuthState {
  authenticated,
  unauthenticated,
  sessionExpired,
}

class SessionExpiredHandler {
  final Ref ref;

  SessionExpiredHandler(this.ref);

  void handleSessionExpired(BuildContext context) {
    ref.listen<AuthState>(authStateProvider, (_, state) {
      if (state == AuthState.sessionExpired) {
        Navigator.of(context).pushNamedAndRemoveUntil(
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
