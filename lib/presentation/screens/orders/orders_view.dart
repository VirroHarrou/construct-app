import 'package:cached_network_image/cached_network_image.dart';
import 'package:construct/presentation/screens/order_detail/order_detail_view.dart';
import 'package:construct/presentation/screens/orders/orders_state.dart';
import 'package:construct/presentation/screens/user/user_view.dart';
import 'package:construct/presentation/widgets/order_card.dart';
import 'package:construct/presentation/widgets/radio_widget.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'orders_controller.dart';

class OrdersView extends ConsumerWidget {
  const OrdersView({super.key});

  static const routeName = '/orders';

  Future<void> navigateTo(
    String orderId,
    BuildContext context,
    WidgetRef ref,
    OrdersController controller,
  ) async {
    final order = await ref.read(orderServiceProvider).getOrder(orderId);
    if (context.mounted) {
      Navigator.of(context)
          .pushNamed(
            OrderDetailView.routeName,
            arguments: order,
          )
          .then((_) => controller.refresh());
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ordersControllerProvider);
    final controller = ref.read(ordersControllerProvider.notifier);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller.refresh(),
        child: CustomScrollView(
          slivers: [
            _buildAppBar(context, controller, state),
            _buildOrderList(state, controller, ref),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar(
      BuildContext context, OrdersController controller, OrdersState state) {
    return SliverAppBar(
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
                    radius: 22.0,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: state.user?.imageUrl ?? '',
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Container(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          child: const Icon(Icons.person, size: 30),
                        ),
                      ),
                    ),
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
                      labelStyle: TextStyle(color: Colors.white, height: 2.0),
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
                onChanged: (value) => controller.setSorting(value),
              ),
            ),
          ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(),
    );
  }

  Widget _buildOrderList(
      OrdersState state, OrdersController controller, WidgetRef ref) {
    if (state.isLoading) {
      return SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()));
    }

    if (state.isRefreshing) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return state.sortedOrders.isNotEmpty
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
                  order: state.sortedOrders[index],
                  isMy: state.sortedOrders[index].userId == state.user?.id,
                  maximize: true,
                  onPressed: () {
                    navigateTo(
                      state.sortedOrders[index].id,
                      context,
                      ref,
                      controller,
                    );
                  },
                ),
              );
            },
            itemCount: state.sortedOrders.length,
          )
        : SliverFillRemaining(
            child: Center(
              child: Text(
                "Пока здесь пусто\nНо скоро обязательно здесь будет много интересного!",
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
