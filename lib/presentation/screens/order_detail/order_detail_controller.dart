import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/entities/review/review.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/presentation/screens/order_detail/order_detail_state.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:construct/services/api/review_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderDetailController
    extends AutoDisposeFamilyNotifier<OrderDetailState, Order> {
  late final OrderService _orderService = ref.read(orderServiceProvider);
  late final UserService _userService = ref.read(userServiceProvider);
  late final ReviewService _reviewService = ref.read(reviewServiceProvider);

  @override
  OrderDetailState build(Order arg) {
    _initialize(arg);
    return OrderDetailState(order: arg);
  }

  Future<void> _initialize(Order order) async {
    try {
      final currentUser = await _userService.getMe();
      state = state.copyWith(me: currentUser);
      await loadData(order);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loadData(Order order) async {
    state = state.copyWith(isLoading: true, order: order);

    try {
      final user = await _userService.getUser(order.userId);
      await _orderService.markOrderViewed(order.id);

      final connectedUsers = order.connectedUserIds.isNotEmpty
          ? await _loadConnectedUsers(order.connectedUserIds)
          : <User>[];

      state = state.copyWith(
        user: user,
        connectedUsers: connectedUsers,
        isLoading: false,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> reloadOrder() async {
    try {
      final updatedOrder = await _orderService.getOrder(state.order.id);
      await loadData(updatedOrder);
    } catch (e) {
      print(e);
    }
  }

  Future<void> completeOrder() async {
    final performer = state.connectedUsers.first;

    final review = ReviewCreate(
      rating: state.rating,
      recipientId: performer.id,
      content: state.content ?? '',
    );
    state = state.copyWith(isResponding: true);
    try {
      await _reviewService.createReview(review);

      await _orderService.updateOrderStatus(
        state.order.id,
        status: 'завершен',
      );

      state = state.copyWith(isResponding: false, isCompletes: false);

      await reloadOrder();
    } catch (e) {
      state = state.copyWith(isResponding: false);
      print(e);
    }
  }

  void toCompletesState() => state = state.copyWith(isCompletes: true);

  void setRating(int num) => state = state.copyWith(rating: num);

  void setContent(String content) => state = state.copyWith(content: content);

  Future<void> respondToOrder() async {
    final currentUser = state.me;
    if (currentUser == null) return;

    state = state.copyWith(isResponding: true);

    try {
      await _orderService.updateOrderStatus(
        state.order.id,
        status: 'ожидание',
      );

      state = state.copyWith(
        order: state.order.copyWith(status: 'ожидание'),
        isResponding: false,
        connectedUsers: [
          ...state.connectedUsers,
          if (!state.connectedUsers.any((u) => u.id == currentUser.id))
            currentUser,
        ],
      );
    } catch (e) {
      state = state.copyWith(isResponding: false);
      rethrow;
    }
  }

  Future<void> selectPerformer(String userId) async {
    try {
      await _orderService.updateOrderStatus(
        state.order.id,
        status: 'в работе',
        userId: userId,
      );
      await reloadOrder();
    } catch (_) {}
  }

  void toggleDescription() {
    state = state.copyWith(showFullDescription: !state.showFullDescription);
  }

  Future<List<User>> _loadConnectedUsers(List<String> ids) async {
    try {
      return await Future.wait(ids.map(_userService.getUser));
    } catch (e) {
      print("Ошибка загрузки пользователей: $e");
      return [];
    }
  }
}

final orderDetailProvider = NotifierProvider.autoDispose
    .family<OrderDetailController, OrderDetailState, Order>(
  OrderDetailController.new,
);
