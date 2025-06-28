import 'package:construct/core/utils/compare_time.dart';
import 'package:construct/domain/entities/order/order.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
    this.maximize = false,
    this.onPressed,
  });
  final bool maximize;
  final VoidCallback? onPressed;
  final Order order;

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
                        getComparedTime(order.beginTime),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz),
                      ),
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
                          order.status!,
                          style: TextStyle(color: Colors.blue),
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
}
