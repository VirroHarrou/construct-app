import 'package:construct/core/utils/app_providers.dart';
import 'package:construct/core/utils/extensions.dart';
import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/presentation/screens/order_detail/order_detail_controller.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:construct/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OrderDetailView extends ConsumerWidget {
  const OrderDetailView({super.key, required this.order});
  final Order order;

  static const routeName = '/order/detail';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserAsync = ref.watch(currentUserProvider);
    final state = ref.watch(orderDetailProvider(order));
    final colorScheme = Theme.of(context).colorScheme;

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
      body: currentUserAsync.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) =>
            Center(child: Text('Ошибка загрузки пользователя')),
        data: (currentUser) {
          return _OrderDetailContent(
            order: order,
            currentUser: currentUser,
            state: state,
            ref: ref,
          );
        },
      ),
    );
  }
}

class _OrderDetailContent extends StatefulWidget {
  final Order order;
  final User? currentUser;
  final OrderDetailState state;
  final WidgetRef ref;

  const _OrderDetailContent({
    required this.order,
    required this.currentUser,
    required this.state,
    required this.ref,
  });

  @override
  State<_OrderDetailContent> createState() => _OrderDetailContentState();
}

class _OrderDetailContentState extends State<_OrderDetailContent> {
  late TextEditingController _reviewController;
  late FocusNode _textFieldFocusNode;
  bool showFull = false;

  @override
  void initState() {
    super.initState();
    _reviewController = TextEditingController();
    _textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _reviewController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final hasImage = !widget.order.imageUrl.isEmptyOrNull;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(18),
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
                          ? CachedNetworkImage(
                              imageUrl: widget.order.imageUrl!,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, child, loadingProgress) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.progress,
                                  ),
                                );
                              },
                              errorWidget: (context, error, stackTrace) {
                                return Container(
                                  color: colorScheme.onSurfaceVariant,
                                );
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
                      _buildInfoRow(
                        Icons.location_on,
                        widget.order.address,
                        colorScheme.secondary,
                        context.widthPx * 0.45,
                      ),
                      Spacer(),
                      _buildInfoRow(
                        Icons.calendar_month,
                        DateFormat.yMd().format(widget.order.beginTime),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 6,
                    children: [
                      _buildInfoRow(
                        Icons.person,
                        S.of(context).viewsCount(widget.order.viewed),
                      ),
                      Spacer(),
                      _buildInfoRow(
                        Icons.lock_open,
                        widget.order.status?.capitalize() ?? 'Открыто',
                        colorScheme.primary,
                      ),
                    ],
                  ),
                  _buildUserInfo(widget.state.user),
                  _buildDescription(),
                  if (widget.currentUser?.id != widget.order.userId &&
                      !widget.order.waitingUserIds
                          .contains(widget.currentUser?.id))
                    _buildResponseButton(colorScheme),
                  if (widget.order.status == 'завершен')
                    _buildReviewInput(colorScheme),
                  if (widget.currentUser?.id == widget.order.userId)
                    _buildRecepientList(widget.state.waitingUsers),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo(User? user, [double fontSize = 12]) {
    if (widget.currentUser == null) return const SizedBox.shrink();

    return Row(
      spacing: 10,
      children: [
        CircleAvatar(
          radius: 27,
          child: CachedNetworkImage(
            imageUrl: widget.order.imageUrl ?? '',
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, child, loadingProgress) {
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.progress,
                ),
              );
            },
            errorWidget: (context, url, error) => CircleAvatar(
              radius: 27,
              backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Text(
              user?.fio ?? '',
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
            ),
            Text(
              user?.address ?? '',
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildDescription() {
    if (widget.order.description == null) return const SizedBox.shrink();

    final fullText = widget.order.description!;
    final shouldTruncate = fullText.length > 200;
    final displayText = showFull || !shouldTruncate
        ? fullText
        : "${fullText.substring(0, 197)}...";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(displayText),
        if (shouldTruncate)
          InkWell(
            onTap: () => setState(() => showFull = !showFull),
            child: Text(
              showFull ? 'Свернуть' : 'Читать больше',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          )
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text,
      [Color? color, double? maxWidth]) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 6),
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            )),
      ],
    );
  }

  Widget _buildResponseButton(ColorScheme colorScheme) {
    return ElevatedButton(
      onPressed: widget.state.isResponding || widget.state.hasResponded
          ? null
          : () => widget.ref
              .read(orderDetailProvider(widget.order).notifier)
              .respondToOrder(widget.order.id),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 30,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (widget.state.isResponding)
            const CircularProgressIndicator(color: Colors.white)
          else
            Text(
              widget.state.hasResponded ? 'Отклик отправлен' : 'Откликнуться',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  TextField _buildReviewInput(ColorScheme colorScheme) {
    return TextField(
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
    );
  }

  Widget _buildRecepientList(List<User> users) {
    if (users.isEmpty) return Center();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Отклики:",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: users.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
              ),
              padding: EdgeInsets.all(10),
              child: _buildUserInfo(users[index], 12),
            ),
          ),
        ),
      ],
    );
  }
}
