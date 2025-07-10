import 'package:construct/core/utils/compare_time.dart';
import 'package:construct/core/utils/extensions.dart';
import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/generated/l10n.dart';
import 'package:construct/presentation/screens/order_editor/order_editor_view.dart';
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
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Theme.of(context).colorScheme.primaryContainer,
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: Colors.black12,
                offset: Offset(0, 4),
              ),
            ]),
        child: Row(
          spacing: 10,
          children: [
            // CachedNetworkImage(
            //   imageUrl: order.imageUrl ?? '',
            //   imageBuilder: (context, imageProvider) => Image(
            //     image: imageProvider,
            //     fit: BoxFit.cover,
            //     width: 105,
            //   ),
            //   progressIndicatorBuilder: (context, url, progress) =>
            //       CupertinoActivityIndicator(),
            //   errorWidget: (context, url, error) => Container(
            //     width: 105,
            //   ),
            // ),
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                spacing: 16,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getComparedTime(order.beginTime, S.of(context)),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      _buildMenuButton(context),
                    ],
                  ),
                  Text(order.title),
                  maximize
                      ? Text(
                          order.description?.characters.take(90).string ?? '')
                      : Center(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${order.price} руб."),
                      if (order.status != null)
                        Text(
                          order.status!.capitalize(),
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
        return IconButton(
          icon: Icon(Icons.more_horiz, color: colorScheme.onSurfaceVariant),
          onPressed: isMy
              ? () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                }
              : null,
        );
      },
      menuChildren: [
        InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12),
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
