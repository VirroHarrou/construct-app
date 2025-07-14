import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/entities/user/user.dart';

class OrderDetailState {
  final Order order;
  final User? user;
  final User? me;
  final List<User> connectedUsers;
  final bool isLoading;
  final bool isResponding;
  final bool showFullDescription;

  OrderDetailState({
    required this.order,
    this.user,
    this.me,
    this.connectedUsers = const [],
    this.isLoading = true,
    this.isResponding = false,
    this.showFullDescription = false,
  });

  bool get hasResponded =>
      me != null && order.connectedUserIds.contains(me!.id);

  OrderDetailState copyWith({
    Order? order,
    User? user,
    User? me,
    List<User>? connectedUsers,
    bool? isLoading,
    bool? isResponding,
    bool? showFullDescription,
  }) {
    return OrderDetailState(
      order: order ?? this.order,
      user: user ?? this.user,
      me: me ?? this.me,
      connectedUsers: connectedUsers ?? this.connectedUsers,
      isLoading: isLoading ?? this.isLoading,
      isResponding: isResponding ?? this.isResponding,
      showFullDescription: showFullDescription ?? this.showFullDescription,
    );
  }
}
