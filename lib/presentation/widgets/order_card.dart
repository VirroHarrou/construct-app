import 'package:cached_network_image/cached_network_image.dart';
import 'package:construct/core/utils/compare_time.dart';
import 'package:construct/core/utils/extensions.dart';
import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/generated/l10n.dart';
import 'package:construct/presentation/screens/order_editor/order_editor_view.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  OrderCard({
    super.key,
    required this.order,
    this.maximize = false,
    this.onPressed,
    this.isMy = false,
  });
  final bool maximize;
  final bool isMy;
  final VoidCallback? onPressed;
  final Order order;
  final menuController = MenuController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final icon = switch (order.status) {
      'ожидание' => Icons.timer,
      'в работе' => Icons.work_rounded,
      'завершен' => Icons.lock,
      _ => Icons.lock_open,
    };
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: colorScheme.primaryContainer,
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: Colors.black12,
                offset: Offset(0, 4),
              ),
            ]),
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: order.logoUrl.isEmptyOrNull
                    ? Container(
                        color: colorScheme.onSurfaceVariant,
                      )
                    : CachedNetworkImage(
                        width: 105,
                        fit: BoxFit.cover,
                        imageUrl: order.logoUrl!,
                        progressIndicatorBuilder: (_, __, progress) => Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                      ),
              ),
              if (!order.logoUrl.isEmptyOrNull) SizedBox(width: 10),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getComparedTime(order.beginTime, S.of(context)),
                          style: TextStyle(color: Colors.grey),
                        ),
                        _buildMenuButton(context),
                      ],
                    ),
                    Text(
                      order.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (maximize) ...[
                      Text(
                        order.description ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${order.price} руб."),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 5,
                          children: [
                            Icon(
                              icon,
                              size: 20,
                              color: colorScheme.primary,
                            ),
                            Text(
                              order.status?.capitalize() ?? 'Открыто',
                              style: TextStyle(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (!isMy) return SizedBox.shrink();
    return MenuAnchor(
      controller: menuController,
      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(colorScheme.primary),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      builder: (context, controller, child) {
        return InkWell(
          child: Icon(Icons.more_horiz, color: colorScheme.onSurfaceVariant),
          onTap: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
        );
      },
      menuChildren: [
        InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const Text(
              'Редактировать заказ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          onTap: () async {
            Navigator.of(context)
                .pushNamed(OrderEditorView.routeName, arguments: order);
          },
        ),
      ],
    );
  }
}
