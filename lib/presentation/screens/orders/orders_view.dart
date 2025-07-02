import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/presentation/screens/order_detail/order_detail_view.dart';
import 'package:construct/presentation/screens/user/user_view.dart';
import 'package:construct/presentation/widgets/order_card.dart';
import 'package:construct/presentation/widgets/radio_widget.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersView extends ConsumerStatefulWidget {
  const OrdersView({super.key});

  static const routeName = '/orders';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrdersViewState();
}

class _OrdersViewState extends ConsumerState<OrdersView> {
  User? user;
  final List<Order> orders = [];
  final List<Order> sortedOrders = [];

  Future<void> getMe() async {
    try {
      user = await ref.read(userServiceProvider).getMe();
      setState(() {});
    } catch (_) {}
  }

  Future<void> loadOrders() async {
    try {
      final data = await ref.read(orderServiceProvider).getConnected();
      setState(() {
        orders.addAll(data);
        sortedOrders.addAll(data);
      });
    } catch (_) {}
  }

  List<Order> sortOrders(List<Order> orders, String sort) {
    final sortedOrders = List<Order>.from(orders);

    switch (sort) {
      case "Я заказчик":
        sortedOrders.removeWhere((order) => order.userId != user?.id);
        return sortedOrders;
      case "Я исполнитель":
        sortedOrders.removeWhere((order) => order.userId == user?.id);
        return sortedOrders;
      default:
        break;
    }
    return orders;
  }

  @override
  void initState() {
    super.initState();
    getMe();
    loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 200,
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18.0,
                    horizontal: 18,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed(UserView.routeName),
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Spacer(),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 276),
                        child: TextField(
                          style: TextStyle(
                              color: Colors.white, height: 0.2, fontSize: 16),
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                            labelText: 'Поиск',
                            labelStyle:
                                TextStyle(color: Colors.white, height: 2.0),
                            contentPadding: EdgeInsets.only(left: 18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 93,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RadioWidget(
                      onChanged: (value) {
                        final newData = sortOrders(orders, value);
                        setState(() {
                          sortedOrders.clear();
                          sortedOrders.addAll(newData);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(),
          ),
          sortedOrders.isNotEmpty
              ? SliverList.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 0.0,
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: OrderCard(
                        order: sortedOrders[index],
                        maximize: true,
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            OrderDetailView.routeName,
                            arguments: sortedOrders[index],
                          );
                        },
                      ),
                    );
                  },
                  itemCount: sortedOrders.length,
                )
              : SliverFillRemaining(
                  child: Center(
                    child: Text(
                      "Пока здесь пусто\nНо скоро обязательно здесь будет много интересного!",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
