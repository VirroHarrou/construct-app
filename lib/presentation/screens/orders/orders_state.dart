import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/entities/user/user.dart';

class OrdersState {
  final User? user;
  final List<Order> orders;
  final List<Order> sortedOrders;
  final bool isLoading;
  final bool isRefreshing;

  OrdersState({
    this.user,
    this.orders = const [],
    this.sortedOrders = const [],
    this.isLoading = true,
    this.isRefreshing = false,
  });

  OrdersState copyWith({
    User? user,
    List<Order>? orders,
    List<Order>? sortedOrders,
    bool? isLoading,
    bool? isRefreshing,
  }) {
    return OrdersState(
      user: user ?? this.user,
      orders: orders ?? this.orders,
      sortedOrders: sortedOrders ?? this.sortedOrders,
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}
