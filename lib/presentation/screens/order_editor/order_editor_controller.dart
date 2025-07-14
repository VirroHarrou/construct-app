import 'package:construct/core/utils/extensions.dart';
import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'order_editor_state.dart';

final orderEditorControllerProvider =
    StateNotifierProvider.autoDispose<OrderEditorController, OrderEditorState>(
        (ref) {
  return OrderEditorController(ref);
});

class OrderEditorController extends StateNotifier<OrderEditorState> {
  final Ref ref;
  Order? _order;

  OrderEditorController(this.ref) : super(OrderEditorState());

  void initialize(Order? order) {
    _order = order;
    state = OrderEditorState(
      title: order?.title,
      imageUrl: order?.imageUrl,
      description: order?.description,
      price: order?.price.toString(),
      address: order?.address,
      beginTime: order != null
          ? DateFormat('dd.MM.yyyy').format(order.beginTime)
          : null,
      endTime:
          order != null ? DateFormat('dd.MM.yyyy').format(order.endTime) : null,
      isInitialized: true,
    );
  }

  void updateField({
    String? title,
    String? imageUrl,
    String? logoUrl,
    String? description,
    String? price,
    String? address,
    String? beginTime,
    String? endTime,
  }) {
    state = state.copyWith(
      title: title,
      imageUrl: imageUrl,
      logoUrl: logoUrl,
      description: description,
      price: price,
      address: address,
      beginTime: beginTime,
      endTime: endTime,
    );
  }

  String? _validate() {
    if (state.title?.isEmpty ?? true) {
      return 'Поле название обязательно';
    }
    if (state.description?.isEmpty ?? true) {
      return 'Поле описание обязательно';
    }
    if (state.price == null || !RegExp(r'\d{1,}').hasMatch(state.price!)) {
      return 'Некорректная стоимость';
    }
    if (state.address?.isEmpty ?? true) {
      return 'Поле адрес обязательно';
    }
    if (state.beginTime == null ||
        state.endTime == null ||
        !RegExp(r'^\d{2}.\d{2}.\d{4}$').hasMatch(state.beginTime!) ||
        !RegExp(r'^\d{2}.\d{2}.\d{4}$').hasMatch(state.endTime!)) {
      return 'Некорректные даты';
    }
    return null;
  }

  Future<void> submit() async {
    final error = _validate();
    if (error != null) {
      state = state.copyWith(errorMessage: error);
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final beginDate = DateFormat('dd.MM.yyyy').parseUtc(state.beginTime!);
      final endDate = DateFormat('dd.MM.yyyy').parseUtc(state.endTime!);

      if (_order == null) {
        await ref.read(orderServiceProvider).createOrder(
              OrderCreate(
                title: state.title!,
                price: state.price!.parsePrice(),
                description: state.description!,
                address: state.address!,
                beginTime: beginDate,
                endTime: endDate,
              ),
            );
      } else {
        await ref.read(orderServiceProvider).updateOrder(
              _order!.id,
              OrderUpdate(
                title: state.title!,
                price: state.price!.parsePrice(),
                description: state.description!,
                address: state.address!,
                beginTime: beginDate,
                endTime: endDate,
              ),
            );
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
