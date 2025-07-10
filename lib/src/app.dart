import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/generated/l10n.dart';
import 'package:construct/presentation/screens/chat/chat_detail_view.dart';
import 'package:construct/presentation/screens/chat/chat_view.dart';
import 'package:construct/presentation/screens/hello/hello_view.dart';
import 'package:construct/presentation/screens/navigation_view.dart';
import 'package:construct/presentation/screens/order_detail/order_detail_view.dart';
import 'package:construct/presentation/screens/order_editor/order_editor_view.dart';
import 'package:construct/presentation/screens/orders/orders_view.dart';
import 'package:construct/presentation/screens/sign_up/sing_up_view.dart';
import 'package:construct/presentation/screens/user/user_edit.dart';
import 'package:construct/presentation/screens/user/user_view.dart';
import 'package:construct/services/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/screens/sign_in/sign_in_view.dart';

part 'theme.dart';
part 'routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionHandler = ref.watch(sessionExpiredHandlerProvider);
    final navigatorKey = ref.watch(navigatorKeyProvider);

    return MaterialApp(
      navigatorKey: navigatorKey,
      restorationScopeId: 'app',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
      theme: _mainTheme,
      darkTheme: ThemeData.dark(),
      onGenerateRoute: (routeSettings) =>
          _getRoutes(routeSettings, sessionHandler),
    );
  }
}
