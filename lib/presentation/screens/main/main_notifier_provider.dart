import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/presentation/screens/main/main_state.dart';
import 'package:construct/presentation/widgets/sortable_button.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainNotifierProvider =
    StateNotifierProvider<MainNotifier, MainState>((ref) {
  return MainNotifier(ref);
});

class MainNotifier extends StateNotifier<MainState> {
  final Ref ref;
  late final _orderService = ref.read(orderServiceProvider);
  late final _userService = ref.read(userServiceProvider);

  MainNotifier(this.ref)
      : super(MainState(
          user: null,
          orders: [],
          sortItems: const [
            SortableItem(
                icon: Icons.date_range_outlined,
                label: "Дата",
                sortOrder: 'asc'),
            SortableItem(
                icon: Icons.price_change,
                label: "Стоимость",
                sortOrder: 'null'),
            SortableItem(
                icon: Icons.location_on,
                label: "Расстояние",
                sortOrder: 'null'),
            SortableItem(
                icon: Icons.people_outline_sharp,
                label: "Популярное",
                sortOrder: 'null'),
            SortableItem(
                icon: Icons.task_sharp, label: "Отклики", sortOrder: 'null'),
          ],
        )) {
    refresh();
  }

  Future<void> refresh() async {
    getMe();
    state = state.copyWith(
      isRefreshing: true,
      page: 0,
      hasMore: true,
    );

    try {
      final orders = await _fetchOrders();
      state = state.copyWith(
        orders: orders,
        isRefreshing: false,
        hasMore: orders.length == 20, // Предполагаем, что limit=20
      );
    } catch (e) {
      state = state.copyWith(isRefreshing: false);
      rethrow;
    }
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true);
    try {
      final nextPage = state.page + 1;
      final newOrders = await _fetchOrders(page: nextPage);

      state = state.copyWith(
        orders: [...state.orders, ...newOrders],
        isLoading: false,
        page: nextPage,
        hasMore: newOrders.length == 20, // Предполагаем, что limit=20
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<List<Order>> _fetchOrders({int page = 0}) async {
    return await _orderService.getAllOrders(
      offset: page * 20,
      limit: 20,
    );
  }

  void updateOrder(Order updatedOrder) {
    final index = state.orders.indexWhere((o) => o.id == updatedOrder.id);
    if (index != -1) {
      final newOrders = List<Order>.from(state.orders);
      newOrders[index] = updatedOrder;
      state = state.copyWith(orders: newOrders);
    }
  }

  Future<void> getMe() async {
    try {
      final user = await _userService.getMe();
      state = state.copyWith(user: user);
    } catch (e) {
      print(e);
    }
  }

  void sortOrders() {
    final sortedOrders = _performSort(List.from(state.orders), state.sortItems);
    state = state.copyWith(orders: sortedOrders);
  }

  List<Order> _performSort(List<Order> orders, List<SortableItem> sortItems) {
    final sortedOrders = List<Order>.from(orders);

    final activeSort = sortItems.firstWhere(
      (item) => item.sortOrder != 'null',
      orElse: () => SortableItem(
        icon: Icons.date_range_outlined,
        label: "Дата",
        sortOrder: 'asc',
      ),
    );

    int Function(Order, Order) getComparator() {
      switch (activeSort.label) {
        case "Дата":
          return (a, b) => a.beginTime.compareTo(b.beginTime);
        case "Стоимость":
          return (a, b) => a.price.compareTo(b.price);
        case "Расстояние":
          return (a, b) => 0;
        case "Популярное":
          return (a, b) => a.viewed.compareTo(b.viewed);
        case "Отклики":
          return (a, b) => 0;
        default:
          return (a, b) => a.beginTime.compareTo(b.beginTime);
      }
    }

    sortedOrders.sort((a, b) {
      final comparator = getComparator();
      final result = comparator(a, b);
      return activeSort.sortOrder == 'asc' ? result : -result;
    });

    return sortedOrders;
  }

  void updateSortItem(int index) {
    final newSortItems = List<SortableItem>.from(state.sortItems);
    final currentOrder = newSortItems[index].sortOrder;

    for (int i = 0; i < newSortItems.length; i++) {
      newSortItems[i] = newSortItems[i].copyWith(sortOrder: 'null');
    }

    if (currentOrder == 'null') {
      newSortItems[index] = newSortItems[index].copyWith(sortOrder: 'asc');
    } else if (currentOrder == 'asc') {
      newSortItems[index] = newSortItems[index].copyWith(sortOrder: 'desc');
    } else {
      newSortItems[index] = newSortItems[index].copyWith(sortOrder: 'null');
    }

    state = state.copyWith(sortItems: newSortItems);
    sortOrders();
  }
}
