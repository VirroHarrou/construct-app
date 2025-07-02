import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/presentation/screens/chat/chat_detail_view.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class OrderDetailView extends ConsumerStatefulWidget {
  const OrderDetailView({super.key, required this.order});
  final Order order;

  static const routeName = '/order/detail';

  @override
  ConsumerState<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends ConsumerState<OrderDetailView> {
  final TextEditingController _reviewController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();
  bool showFull = false;
  bool isAwait = false;
  User? user;

  Future<void> initWidget() async {
    final userService = ref.read(userServiceProvider);
    final newUser = await userService.getUser(widget.order.userId);
    await ref.read(orderServiceProvider).markOrderViewed(widget.order.id);
    setState(() {
      user = newUser;
    });
  }

  @override
  void initState() {
    super.initState();
    initWidget();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final hasImage = !widget.order.imageUrl.isEmptyOrNull;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: colorScheme.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: colorScheme.primaryContainer,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    SizedBox(
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: hasImage
                            ? Image.network(
                                widget.order.imageUrl!,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                      color: colorScheme.onSurfaceVariant);
                                },
                              )
                            : Container(color: colorScheme.onSurfaceVariant),
                      ),
                    ),
                    Text(
                      widget.order.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${widget.order.price} р',
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: colorScheme.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: colorScheme.primary,
                        ),
                        Text(
                          widget.order.address,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Icon(
                          Icons.calendar_month,
                          color: colorScheme.primary,
                        ),
                        Text(
                          DateFormat.yMd().format(widget.order.beginTime),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        Icon(
                          Icons.person,
                          color: colorScheme.primary,
                        ),
                        Text(
                          '${widget.order.viewed} Просмотров',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Icon(
                          Icons.lock_open,
                          color: colorScheme.primary,
                        ),
                        Text(
                          widget.order.status ?? 'Открыто',
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    if (user != null) ...[
                      InkWell(
                        onTap: () => Navigator.of(context).pushNamed(
                            ChatDetailView.routeName,
                            arguments: user as User),
                        child: Row(
                          spacing: 10,
                          children: [
                            CircleAvatar(
                              radius: 27,
                              backgroundColor: colorScheme.onSurfaceVariant,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 5,
                              children: [
                                Text(user!.fio),
                                Text(user!.address),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                    if (widget.order.description != null) ...[
                      Text(showFull
                          ? widget.order.description!
                          : "${widget.order.description!.characters.take(197).string}..."),
                      if (widget.order.description!.length > 200) ...[
                        InkWell(
                          onTap: () => setState(() {
                            showFull = !showFull;
                          }),
                          child: Text(
                            showFull ? 'Свернуть' : 'Читать больше',
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ]
                    ],
                    if (user?.id != widget.order.userId)
                      ElevatedButton(
                        onPressed: isAwait
                            ? null
                            : () async {
                                try {
                                  await ref
                                      .read(orderServiceProvider)
                                      .updateOrderStatus(widget.order.id,
                                          status: 'ожидание');
                                  isAwait = true;
                                } catch (_) {}
                              },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 30,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Откликнуться',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    TextField(
                      focusNode: _textFieldFocusNode,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      controller: _reviewController,
                      decoration: InputDecoration(
                        hintText: 'Оставить отзыв...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: colorScheme.primary,
                            width: 0.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: colorScheme.primary,
                            width: 0.5,
                          ),
                        ),
                      ),
                      maxLines: 5,
                      minLines: 1,
                      onSubmitted: (content) => {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
