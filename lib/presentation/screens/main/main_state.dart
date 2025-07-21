import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/presentation/widgets/sortable_button.dart';

class MainState {
  final User? user;
  final List<Order> orders;
  final List<SortableItem> sortItems;
  final bool isLoading;
  final bool hasMore;
  final int page;
  final bool isRefreshing;

  MainState({
    this.user,
    required this.orders,
    required this.sortItems,
    this.isLoading = false,
    this.hasMore = true,
    this.page = 0,
    this.isRefreshing = false,
  });

  MainState copyWith({
    User? user,
    List<Order>? orders,
    List<SortableItem>? sortItems,
    bool? isLoading,
    bool? hasMore,
    int? page,
    bool? isRefreshing,
  }) {
    return MainState(
      user: user ?? this.user,
      orders: orders ?? this.orders,
      sortItems: sortItems ?? this.sortItems,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}
