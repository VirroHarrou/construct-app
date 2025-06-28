import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/generated/l10n.dart';
import 'package:construct/presentation/screens/hello/hello_view.dart';
import 'package:construct/presentation/screens/navigation_view.dart';
import 'package:construct/presentation/screens/order_detail/order_detail_view.dart';
import 'package:construct/presentation/screens/order_editor/order_editor_view.dart';
import 'package:construct/presentation/screens/orders/orders_view.dart';
import 'package:construct/presentation/screens/sign_up/sing_up_view.dart';
import 'package:construct/services/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/screens/sign_in/sign_in_view.dart';

/// The Widget that configures your application.
class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionHandler = ref.watch(sessionExpiredHandlerProvider);
    return Builder(
      builder: (BuildContext context) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
          theme: ThemeData(
            colorScheme: const ColorScheme(
              primary: Color(0xFF4285F4),
              onPrimary: Colors.white,
              secondary: Colors.black,
              onSecondary: Colors.white,
              surface: Color(0xFFF0F0F1),
              primaryContainer: Colors.white,
              onSecondaryContainer: Color(0xFFB8B8B8),
              secondaryContainer: Color(0xFF9EA6BE),
              onSurface: Colors.black,
              onSurfaceVariant: Color(0xFF9EA6BE),
              error: Color(0xFF711D1D),
              onError: Colors.white,
              brightness: Brightness.light,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                minimumSize: WidgetStatePropertyAll(
                  const Size(double.infinity, 54),
                ),
                alignment: Alignment.center,
                backgroundColor: WidgetStatePropertyAll<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
                surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
                padding: WidgetStatePropertyAll(
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                textStyle: WidgetStatePropertyAll(
                  const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                foregroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  side: BorderSide.none,
                )),
              ),
            ),
          ),
          darkTheme: ThemeData.dark(),
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                sessionHandler.handleSessionExpired(context);
                switch (routeSettings.name) {
                  case NavigationView.routeName:
                    return NavigationView();
                  case OrdersView.routeName:
                    return const OrdersView();
                  case HelloView.routeName:
                    return const HelloView();
                  case SignInView.routeName:
                    return const SignInView();
                  case SignUpView.routeName:
                    return const SignUpView();
                  case OrderEditorView.routeName:
                    return OrderEditorView(
                      order: routeSettings.arguments as Order?,
                    );
                  case OrderDetailView.routeName:
                    return OrderDetailView(
                      order: routeSettings.arguments as Order,
                    );
                  default:
                    return const OrderEditorView(order: null);
                }
              },
            );
          },
        );
      },
    );
  }
}
