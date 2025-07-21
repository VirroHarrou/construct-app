import 'package:construct/core/utils/extensions.dart';
import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/presentation/screens/chat/chat_detail_view.dart';
import 'package:construct/presentation/screens/order_detail/order_detail_controller.dart';
import 'package:construct/presentation/screens/order_detail/order_detail_state.dart';
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
    final state = ref.watch(orderDetailProvider(this.order));
    final controller = ref.read(orderDetailProvider(this.order).notifier);
    final order = state.order;

    return Scaffold(
      appBar: AppBar(leading: _buildBackButton(context, state)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            _buildOrderCard(context, state, controller, order),
          ],
        ),
      ),
    );
  }

  IconButton _buildBackButton(BuildContext context, OrderDetailState state) {
    return IconButton(
      onPressed: () => Navigator.pop(context, state.order),
      icon: Icon(Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.primary),
    );
  }

  Widget _buildOrderCard(
    BuildContext context,
    OrderDetailState state,
    OrderDetailController controller,
    Order order,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colorScheme.primaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOrderImage(order, colorScheme),
          const SizedBox(height: 20),
          _buildOrderTitle(order, colorScheme),
          const SizedBox(height: 8),
          _buildOrderPrice(order, colorScheme),
          const SizedBox(height: 20),
          _buildOrderMetaRow1(context, order, colorScheme),
          const SizedBox(height: 12),
          _buildOrderMetaRow2(context, state, colorScheme),
          const SizedBox(height: 20),
          _buildCustomerInfo(state, context, colorScheme),
          const SizedBox(height: 20),
          _buildDescription(state, controller, context),
          if (state.me?.id != state.user?.id) ...[
            const SizedBox(height: 20),
            if (state.statusNum < 2)
              _buildResponseButton(state, controller, context),
            if (state.statusNum >= 2)
              _buildRecipientList(state, context, controller),
          ],
          if (state.me?.id == order.userId && !state.isCompletes) ...[
            const SizedBox(height: 20),
            _buildRecipientList(state, context, controller),
          ],
          if (state.me?.id == order.userId &&
              state.statusNum == 2 &&
              !state.isCompletes) ...[
            const SizedBox(height: 20),
            _buildCompleteButton(state, controller, context),
          ],
          if (state.isCompletes) ...[
            const SizedBox(height: 20),
            _buildReviewInput(colorScheme, controller, state),
          ]
        ],
      ),
    );
  }

  Widget _buildOrderImage(Order order, ColorScheme colorScheme) {
    return SizedBox(
      height: 134,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: order.imageUrl.isEmptyOrNull
            ? Container(color: colorScheme.onSurfaceVariant)
            : CachedNetworkImage(
                width: double.infinity,
                imageUrl: order.imageUrl!,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (_, __, progress) => Center(
                  child: CircularProgressIndicator(value: progress.progress),
                ),
                errorWidget: (_, __, ___) =>
                    Container(color: colorScheme.onSurfaceVariant),
              ),
      ),
    );
  }

  Widget _buildOrderTitle(Order order, ColorScheme colorScheme) {
    return Text(
      order.title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: colorScheme.primary,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildOrderPrice(Order order, ColorScheme colorScheme) {
    return Text(
      '${order.price} р',
      style: TextStyle(
        fontSize: 16,
        color: colorScheme.secondary,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildOrderMetaRow1(
    BuildContext context,
    Order order,
    ColorScheme colorScheme,
  ) {
    return Row(
      children: [
        _buildInfoRow(
          context,
          Icons.location_on,
          order.address,
          maxWidth: context.widthPx * 0.45,
          color: colorScheme.secondary,
        ),
        const Spacer(),
        _buildInfoRow(
          context,
          Icons.calendar_month,
          DateFormat.yMd().format(order.beginTime),
        ),
      ],
    );
  }

  Widget _buildOrderMetaRow2(
    BuildContext context,
    OrderDetailState state,
    ColorScheme colorScheme,
  ) {
    final icon = switch (state.statusNum) {
      1 => Icons.timer,
      2 => Icons.work_rounded,
      3 => Icons.lock,
      _ => Icons.lock_open,
    };
    return Row(
      children: [
        _buildInfoRow(
          context,
          Icons.person,
          S.of(context).viewsCount(state.order.viewed),
        ),
        const Spacer(),
        _buildInfoRow(
          context,
          icon,
          state.order.status?.capitalize() ?? 'Открыто',
          color: colorScheme.primary,
        ),
      ],
    );
  }

  Widget _buildUserInfo(User? user, BuildContext context) {
    if (user == null) return const SizedBox();

    return Row(
      children: [
        CircleAvatar(
          radius: 27.0,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: user.imageUrl ?? '',
              width: 54,
              height: 54,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) => Container(
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
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                user.company?.name ?? user.fio,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                user.address,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDescription(OrderDetailState state,
      OrderDetailController controller, BuildContext context) {
    final description = state.order.description;
    if (description == null) return const SizedBox();

    final shouldTruncate = description.length > 200;
    final displayText = state.showFullDescription || !shouldTruncate
        ? description
        : "${description.substring(0, 197)}...";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(displayText),
        if (shouldTruncate)
          InkWell(
            onTap: controller.toggleDescription,
            child: Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                state.showFullDescription ? 'Свернуть' : 'Читать больше',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String text, {
    Color? color,
    double? maxWidth,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 6),
        SizedBox(
          width: maxWidth,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerInfo(
      OrderDetailState state, BuildContext context, ColorScheme colorScheme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: _buildUserInfo(state.user, context)),
        if (state.isMePerformer && state.statusNum < 3) ...[
          const SizedBox(width: 10),
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              ChatDetailView.routeName,
              arguments: state.user,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Написать",
                style: TextStyle(
                  color: colorScheme.onPrimaryContainer,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildResponseButton(
    OrderDetailState state,
    OrderDetailController controller,
    BuildContext context,
  ) {
    final canRespond =
        !state.hasResponded && state.statusNum < 2 && !state.isResponding;

    return ElevatedButton(
      onPressed: canRespond ? controller.respondToOrder : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
      ),
      child: state.isResponding
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(
              state.hasResponded ? 'Отклик отправлен' : 'Откликнуться',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
    );
  }

  Widget _buildCompleteButton(
    OrderDetailState state,
    OrderDetailController controller,
    BuildContext context,
  ) {
    return ElevatedButton(
      onPressed: () => controller.toCompletesState(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
      ),
      child: state.isResponding
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(
              'Закрыть заказ',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
    );
  }

  Widget _buildReviewInput(
    ColorScheme colorScheme,
    OrderDetailController controller,
    OrderDetailState state,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          style: TextStyle(
            fontSize: 12,
          ),
          onChanged: (value) => controller.setContent(value),
          decoration: InputDecoration(
            hintText: 'Напишите отзыв...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 1,
              ),
            ),
          ),
          maxLines: 5,
          minLines: 1,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => controller.setRating(1),
              icon: Icon(
                state.rating >= 1 ? Icons.star_outlined : Icons.star_border,
                color: colorScheme.primary,
              ),
            ),
            IconButton(
              onPressed: () => controller.setRating(2),
              icon: Icon(
                state.rating >= 2 ? Icons.star_outlined : Icons.star_border,
                color: colorScheme.primary,
              ),
            ),
            IconButton(
              onPressed: () => controller.setRating(3),
              icon: Icon(
                state.rating >= 3 ? Icons.star_outlined : Icons.star_border,
                color: colorScheme.primary,
              ),
            ),
            IconButton(
              onPressed: () => controller.setRating(4),
              icon: Icon(
                state.rating >= 4 ? Icons.star_outlined : Icons.star_border,
                color: colorScheme.primary,
              ),
            ),
            IconButton(
              onPressed: () => controller.setRating(5),
              icon: Icon(
                state.rating >= 5 ? Icons.star_outlined : Icons.star_border,
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
        state.isResponding
            ? Center(child: CircularProgressIndicator())
            : TextButton(
                onPressed: controller.completeOrder,
                style: TextButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Text(
                  'Отправить',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
      ],
    );
  }

  Widget _buildRecipientList(
    OrderDetailState state,
    BuildContext context,
    OrderDetailController controller,
  ) {
    if (state.connectedUsers.isEmpty) return const SizedBox();

    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          state.statusNum >= 2
              ? state.statusNum == 3
                  ? "Выполнил:"
                  : "Выполняет:"
              : "Отклики:",
          style: TextStyle(
            color: colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.connectedUsers.length,
          itemBuilder: (_, index) => _buildRecipientItem(
            state.connectedUsers[index],
            state.statusNum == 2,
            controller,
            state,
            context,
          ),
        ),
      ],
    );
  }

  Widget _buildRecipientItem(
    User user,
    bool isWorking,
    OrderDetailController controller,
    OrderDetailState state,
    BuildContext context,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorScheme.primary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: _buildUserInfo(user, context)),
          if (state.isMeCustomer && state.statusNum != 3) ...[
            const SizedBox(width: 10),
            InkWell(
              onTap: () => isWorking
                  ? Navigator.pushNamed(
                      context,
                      ChatDetailView.routeName,
                      arguments: user,
                    )
                  : controller.selectPerformer(user.id),
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  isWorking ? "Написать" : "Выбрать",
                  style: TextStyle(
                    color: colorScheme.onPrimaryContainer,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
