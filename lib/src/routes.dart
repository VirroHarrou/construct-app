part of 'app.dart';

_getRoutes(RouteSettings routeSettings, SessionExpiredHandler sessionHandler) {
  return MaterialPageRoute<void>(
    settings: routeSettings,
    builder: (BuildContext context) {
      sessionHandler.handleSessionExpired();
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
        case UserView.routeName:
          return const UserView();
        case UserEditView.routeName:
          return UserEditView(routeSettings.arguments as User);
        case OrderEditorView.routeName:
          return OrderEditorView(
            order: routeSettings.arguments as Order?,
          );
        case OrderDetailView.routeName:
          return OrderDetailView(
            order: routeSettings.arguments as Order,
          );
        case ChatView.routeName:
          return ChatView();
        case ChatDetailView.routeName:
          return ChatDetailView(
            user: routeSettings.arguments as User,
          );

        default:
          return const OrderEditorView(order: null);
      }
    },
  );
}
