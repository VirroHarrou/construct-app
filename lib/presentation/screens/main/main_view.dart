import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/presentation/screens/order_detail/order_detail_view.dart';
import 'package:construct/presentation/screens/order_editor/order_editor_view.dart';
import 'package:construct/presentation/widgets/order_card.dart';
import 'package:construct/presentation/widgets/sortable_button.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  static const routeName = "/main";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MainViewState();
}

class MainViewState extends ConsumerState<MainView> {
  List<SortableItem> sortItems = [
    SortableItem(
        icon: Icons.date_range_outlined, label: "Дата", sortOrder: 'asc'),
    SortableItem(
        icon: Icons.price_change, label: "Стоимость", sortOrder: 'null'),
    SortableItem(
        icon: Icons.location_on, label: "Расстояние", sortOrder: 'null'),
    SortableItem(
        icon: Icons.people_outline_sharp,
        label: "Популярное",
        sortOrder: 'null'),
    SortableItem(icon: Icons.task_sharp, label: "Отклики", sortOrder: 'null'),
  ];

  User? user;
  final List<Order> orders = [];

  Future<void> getMe() async {
    try {
      user = await ref.read(userServiceProvider).getMe();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadOrders() async {
    final data = await ref.read(orderServiceProvider).getAllOrders();
    orders.clear();
    setState(() {
      orders.addAll(sortOrders(data, sortItems));
    });
  }

  List<Order> sortOrders(List<Order> orders, List<SortableItem> sortItems) {
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
          //Todo: Заглушка - требуется реализация логики расчета расстояния
          return (a, b) => 0;
        case "Популярное":
          return (a, b) => a.viewed.compareTo(b.viewed);
        case "Отклики":
          //Todo: Заглушка - требуется поле с количеством откликов
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

  @override
  void initState() {
    super.initState();
    getMe();
    loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 200,
            backgroundColor: colorScheme.primary,
            title: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 17),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Привет, ${user?.fio.split(" ")[1] ?? '-'}, хочешь ",
                          style: TextStyle(fontSize: 16),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed(OrderEditorView.routeName),
                          child: Text(
                            "создать заказ?",
                            style: TextStyle(
                              fontSize: 16,
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 335,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://avatars.mds.yandex.net/i?id=28daac16dcd94bdc256223d854aa974f_l-4216502-images-thumbs&n=13"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, right: 24, top: 10),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SortableButtonRow(
                      items: sortItems,
                      onItemPressed: (index) {
                        setState(() {
                          final currentOrder = sortItems[index].sortOrder;
                          if (currentOrder == 'null') {
                            sortItems[index] =
                                sortItems[index].copyWith(sortOrder: 'asc');
                          } else if (currentOrder == 'asc') {
                            sortItems[index] =
                                sortItems[index].copyWith(sortOrder: 'desc');
                          } else {
                            sortItems[index] =
                                sortItems[index].copyWith(sortOrder: 'null');
                          }
                          final newOrders = sortOrders(orders, sortItems);
                          orders.clear();
                          orders.addAll(newOrders);
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Запросы"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          orders.isNotEmpty
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
                        order: orders[index],
                        maximize: false,
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            OrderDetailView.routeName,
                            arguments: orders[index],
                          );
                        },
                      ),
                    );
                  },
                  itemCount: orders.length,
                )
              : SliverFillRemaining(
                  child: Center(
                    child: Text(
                      "Пока здесь пусто\nНо скоро обязательно здесь будет много интересного!",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
