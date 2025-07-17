import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/entities/user/user.dart';

class OrderDetailState {
  final Order order;
  final User? user;
  final User? me;
  final List<User> connectedUsers;
  final bool isLoading;
  final bool isResponding;
  final bool isCompletes;
  final bool showFullDescription;
  final int rating;
  final String? content;

  OrderDetailState({
    required this.order,
    this.user,
    this.me,
    this.connectedUsers = const [],
    this.isLoading = true,
    this.isResponding = false,
    this.showFullDescription = false,
    this.isCompletes = false,
    this.rating = 0,
    this.content,
  });

  bool get isMePerformer =>
      me?.id != null && order.connectedUserIds.contains(me?.id);

  bool get isMeCustomer {
    final myId = me?.id;
    final userId = user?.id;
    return myId != null && userId != null && myId == userId;
  }

  bool get hasResponded =>
      me != null && order.connectedUserIds.contains(me!.id);

  int get statusNum =>
      const [null, 'ожидание', 'в работе', 'завершен'].indexOf(order.status);

  OrderDetailState copyWith({
    Order? order,
    User? user,
    User? me,
    List<User>? connectedUsers,
    bool? isLoading,
    bool? isResponding,
    bool? showFullDescription,
    bool? isCompletes,
    int? rating,
    String? content,
  }) {
    return OrderDetailState(
      order: order ?? this.order,
      user: user ?? this.user,
      me: me ?? this.me,
      connectedUsers: connectedUsers ?? this.connectedUsers,
      isLoading: isLoading ?? this.isLoading,
      isResponding: isResponding ?? this.isResponding,
      showFullDescription: showFullDescription ?? this.showFullDescription,
      isCompletes: isCompletes ?? this.isCompletes,
      rating: rating ?? this.rating,
      content: content ?? this.content,
    );
  }
}
