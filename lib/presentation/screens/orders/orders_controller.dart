import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/presentation/screens/orders/orders_state.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ordersControllerProvider =
    StateNotifierProvider.autoDispose<OrdersController, OrdersState>((ref) {
  return OrdersController(ref);
});

class OrdersController extends StateNotifier<OrdersState> {
  final Ref ref;

  OrdersController(this.ref) : super(OrdersState()) {
    _init();
  }

  Future<void> _init() async {
    await getMe();
    await loadOrders();
  }

  Future<void> getMe() async {
    try {
      final user = await ref.read(userServiceProvider).getMe();
      state = state.copyWith(user: user);
    } catch (_) {
      state = state.copyWith(user: null);
    }
  }

  Future<void> refresh() async {
    try {
      state = state.copyWith(isRefreshing: true);
      final data = await ref.read(orderServiceProvider).getConnected();
      state = state.copyWith(
        orders: data,
        sortedOrders: data,
        isRefreshing: false,
      );
      sortOrders();
    } catch (_) {
      state = state.copyWith(isRefreshing: false);
    }
  }

  void setSorting(String value) {
    state = state.copyWith(sort: value);
    sortOrders();
  }

  Future<void> loadOrders() async {
    try {
      final data = await ref.read(orderServiceProvider).getConnected();
      state = state.copyWith(
        orders: data,
        sortedOrders: data,
        isLoading: false,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  void sortOrders() {
    if (state.user == null) return;

    final newSortedOrders = switch (state.sort) {
      "Я заказчик" =>
        state.orders.where((o) => o.userId == state.user!.id).toList(),
      "Я исполнитель" =>
        state.orders.where((o) => o.userId != state.user!.id).toList(),
      _ => List<Order>.from(state.orders),
    };

    state = state.copyWith(sortedOrders: newSortedOrders);
  }
}
