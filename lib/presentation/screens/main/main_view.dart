import 'package:construct/generated/l10n.dart';
import 'package:construct/presentation/screens/order_detail/order_detail_view.dart';
import 'package:construct/presentation/screens/order_editor/order_editor_view.dart';
import 'package:construct/presentation/widgets/order_card.dart';
import 'package:construct/presentation/widgets/sortable_button.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main_notifier_provider.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  static const routeName = "/main";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainNotifierProvider);
    final notifier = ref.read(mainNotifierProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    Future<void> navigateTo(String orderId) async {
      final order = await ref.read(orderServiceProvider).getOrder(orderId);
      if (context.mounted) {
        Navigator.of(context).pushNamed(
          OrderDetailView.routeName,
          arguments: order,
        );
      }
      notifier.loadData();
    }

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
                          S.of(context).welcomePhrase(
                              state.user?.fio.split(" ")[1] ?? 'Noname'),
                          style: TextStyle(fontSize: 16),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed(OrderEditorView.routeName),
                          child: Text(
                            S.of(context).createOrderQ,
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
                      items: state.sortItems,
                      onItemPressed: (index) {
                        notifier.updateSortItem(index);
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
          state.orders.isNotEmpty
              ? SliverList.builder(
                  itemBuilder: (context, index) {
                    final order = state.orders[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 0.0,
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: OrderCard(
                        order: order,
                        isMy: order.userId == state.user?.id,
                        maximize: false,
                        onPressed: () => navigateTo(order.id),
                      ),
                    );
                  },
                  itemCount: state.orders.length,
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
