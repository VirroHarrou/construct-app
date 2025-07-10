import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/presentation/widgets/sortable_button.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainState {
  final User? user;
  final List<Order> orders;
  final List<SortableItem> sortItems;

  MainState({
    this.user,
    required this.orders,
    required this.sortItems,
  });

  MainState copyWith({
    User? user,
    List<Order>? orders,
    List<SortableItem>? sortItems,
  }) {
    return MainState(
      user: user ?? this.user,
      orders: orders ?? this.orders,
      sortItems: sortItems ?? this.sortItems,
    );
  }
}

// Провайдер для состояния
final mainNotifierProvider =
    StateNotifierProvider<MainNotifier, MainState>((ref) {
  return MainNotifier(ref);
});

// Контроллер состояния
class MainNotifier extends StateNotifier<MainState> {
  final Ref ref;

  MainNotifier(this.ref)
      : super(MainState(
          user: null,
          orders: [],
          sortItems: [
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
    loadData();
  }

  Future<void> loadData() async {
    await getMe();
    await loadOrders();
  }

  Future<void> getMe() async {
    try {
      final user = await ref.read(userServiceProvider).getMe();
      state = state.copyWith(user: user);
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadOrders() async {
    final data = await ref.read(orderServiceProvider).getAllOrders();
    state = state.copyWith(orders: data);
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
