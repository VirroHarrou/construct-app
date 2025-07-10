// order_detail_controller.dart
import 'package:construct/core/utils/app_providers.dart';
import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderDetailState {
  final User? user;
  final List<User> waitingUsers;
  final bool isResponding;
  final bool hasResponded;

  OrderDetailState({
    this.user,
    this.waitingUsers = const [],
    this.isResponding = false,
    this.hasResponded = false,
  });

  OrderDetailState copyWith({
    User? user,
    List<User>? waitingUsers,
    bool? isResponding,
    bool? hasResponded,
  }) {
    return OrderDetailState(
      user: user ?? this.user,
      isResponding: isResponding ?? this.isResponding,
      hasResponded: hasResponded ?? this.hasResponded,
      waitingUsers: waitingUsers ?? this.waitingUsers,
    );
  }
}

class OrderDetailController
    extends AutoDisposeFamilyNotifier<OrderDetailState, Order> {
  @override
  OrderDetailState build(Order arg) {
    _init(arg);
    return OrderDetailState();
  }

  Future<void> _init(Order order) async {
    final userService = ref.read(userServiceProvider);
    try {
      final newUser = await userService.getUser(order.userId);
      await ref.read(orderServiceProvider).markOrderViewed(order.id);
      state = state.copyWith(user: newUser);

      if (order.waitingUserIds.isNotEmpty) {
        loadWaitingUsers(userService, order.waitingUserIds);
      } else {
        state = state.copyWith(waitingUsers: []);
      }
    } catch (_) {}
  }

  Future<void> respondToOrder(String orderId) async {
    final currentUser = await ref.read(currentUserProvider.future);
    if (currentUser == null) return;

    state = state.copyWith(isResponding: true);

    try {
      await ref.read(orderServiceProvider).updateOrderStatus(
            orderId,
            status: 'ожидание',
          );
      state = state.copyWith(
        isResponding: false,
        hasResponded: true,
      );
    } catch (e) {
      print(e);
      state = state.copyWith(isResponding: false);
      rethrow;
    }
  }

  Future<void> loadWaitingUsers(UserService service, List<String> ids) async {
    try {
      final users = await Future.wait(ids.map((id) => service.getUser(id)));
      state = state.copyWith(waitingUsers: users);
    } catch (e) {
      print("Ошибка загрузки пользователей: $e");
    }
  }
}

final orderDetailProvider = NotifierProvider.autoDispose
    .family<OrderDetailController, OrderDetailState, Order>(
  OrderDetailController.new,
);
