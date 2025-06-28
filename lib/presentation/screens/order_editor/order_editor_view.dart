import 'dart:ui';

import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/presentation/screens/navigation_view.dart';
import 'package:construct/presentation/widgets/primary_text_field.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class OrderEditorView extends ConsumerStatefulWidget {
  final Order? order;
  const OrderEditorView({super.key, required this.order});

  static const routeName = '/order_editor';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OrderEditorViewState();
}

class _OrderEditorViewState extends ConsumerState<OrderEditorView> {
  final titleController = TextEditingController();
  final photoController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final addressController = TextEditingController();
  final beginTimeController = TextEditingController();
  final endTimeController = TextEditingController();

  String? errorMessage;

  String? validate() {
    if (titleController.text.isEmpty) {
      return 'Поле название должно быть заполено!';
    }
    // if (photoController.text.isEmpty) return 'Поле фото должно быть заполено!';
    if (descriptionController.text.isEmpty) {
      return 'Поле описание должно быть заполено!';
    }
    if (!RegExp(r'\d{1,}').hasMatch(priceController.text)) {
      return 'Поле стоимость должно быть числом!';
    }
    if (addressController.text.isEmpty) {
      return 'Поле адрес должно быть заполено!';
    }
    if (!RegExp(r'^\d{2}.\d{2}.\d{4}$').hasMatch(beginTimeController.text) ||
        !RegExp(r'^\d{2}.\d{2}.\d{4}$').hasMatch(endTimeController.text)) {
      return 'Поля с датой должны быть заполены корректно!';
    }
    return null;
  }

  Future<void> createOrder(OrderCreate order) async {
    try {
      if (context.mounted) {
        await ref.read(orderServiceProvider).createOrder(order);
        Navigator.of(context).pushReplacementNamed(NavigationView.routeName);
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.arrow_back_ios,
          color: colorScheme.primary,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 18.0,
            left: 18.0,
            top: 140,
            bottom: 40,
          ),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Column(
                  spacing: 3,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Создание заказа',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Внесите нужные данные о заказе.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                PrimaryTextField(
                  textEditingController: titleController,
                  label: 'Название:',
                  hintText: 'Проект создания нового жилого комплекса...',
                  maxLength: 256,
                  maxLines: 5,
                ),
                _buildImageUploader(),
                PrimaryTextField(
                  textEditingController: descriptionController,
                  label: 'Описание:',
                  hintText: 'Техническое задание на создание...',
                  maxLength: 512,
                  maxLines: 9,
                ),
                PrimaryTextField(
                  textEditingController: priceController,
                  label: 'Стоимость:',
                  hintText: '25 000',
                ),
                PrimaryTextField(
                  textEditingController: addressController,
                  label: 'Место оказания услуги:',
                  hintText: 'г. Ярославль, ул. Урочская 112',
                  maxLength: 100,
                  maxLines: 2,
                  textCapitalization: TextCapitalization.none,
                ),
                SizedBox(
                  child: _buildDateSelector(),
                ),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: TextStyle(color: colorScheme.error),
                  ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      errorMessage = validate();
                    });
                    if (errorMessage == null) {
                      final beginDate = DateFormat('dd.MM.yyyy')
                          .parse(beginTimeController.text);
                      final endDate = DateFormat('dd.MM.yyyy')
                          .parse(endTimeController.text);
                      final order = OrderCreate(
                        title: titleController.text,
                        price: double.parse(priceController.text),
                        description: descriptionController.text,
                        address: addressController.text,
                        beginTime: beginDate,
                        endTime: endDate,
                      );
                      createOrder(order);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  child: Text('Создать заказ'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    final colorScheme = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: colorScheme.onSurfaceVariant,
        width: 1,
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Дата оказания услуги:',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4.0, bottom: 4),
                    child: Text(
                      'Начало',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  TextField(
                    controller: beginTimeController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    maxLines: 1,
                    inputFormatters: [
                      MaskTextInputFormatter(
                        mask: "xx.xx.xxxx",
                        filter: {
                          "x": RegExp(r'\d'),
                        },
                      )
                    ],
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      hintText: "13.05.2025",
                      enabledBorder: border,
                      border: border,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4.0, bottom: 4),
                    child: Text(
                      'Окончание',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  TextField(
                    controller: endTimeController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    maxLines: 1,
                    inputFormatters: [
                      MaskTextInputFormatter(
                        mask: "xx.xx.xxxx",
                        filter: {
                          "x": RegExp(r'\d'),
                        },
                      ),
                    ],
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      hintText: "13.05.2025",
                      enabledBorder: border,
                      border: border,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImageUploader() {
    final hasImage =
        widget.order?.imageUrl != null && widget.order!.imageUrl!.isNotEmpty;
    final borderRadius = BorderRadius.circular(14);
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Фото:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Фоновое изображение или цвет
                if (hasImage)
                  Image.network(
                    widget.order!.imageUrl!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: colorScheme.onSurfaceVariant);
                    },
                  )
                else
                  Container(color: colorScheme.onSurfaceVariant),

                // Кнопка с эффектом смазанности
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          hasImage ? 'Заменить' : 'Загрузить',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
