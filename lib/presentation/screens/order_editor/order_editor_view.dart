import 'package:construct/core/utils/money_input_formatter.dart';
import 'package:construct/domain/entities/order/order.dart';
import 'package:construct/presentation/screens/navigation_view.dart';
import 'package:construct/presentation/widgets/date_selector.dart';
import 'package:construct/presentation/widgets/image_uploader/image_uploader.dart';
import 'package:construct/presentation/widgets/primary_text_field.dart';
import 'package:construct/services/api/order_service.dart';
import 'package:construct/services/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:construct/core/utils/extensions.dart';

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
  final imageUrlController = TextEditingController();
  final logoUrlController = TextEditingController();
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
      await ref.read(orderServiceProvider).createOrder(order);
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed(NavigationView.routeName);
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  Future<void> updateOrder(OrderUpdate order) async {
    try {
      await ref.read(orderServiceProvider).updateOrder(widget.order!.id, order);
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed(NavigationView.routeName);
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.order != null) {
      titleController.text = widget.order!.title;
      imageUrlController.text = widget.order!.imageUrl ?? '';
      logoUrlController.text = widget.order!.logoUrl ?? '';
      descriptionController.text = widget.order!.description ?? '';
      priceController.text = widget.order!.price.toString();
      addressController.text = widget.order!.address;
      beginTimeController.text =
          DateFormat('dd.MM.yyyy').format(widget.order!.beginTime);
      endTimeController.text =
          DateFormat('dd.MM.yyyy').format(widget.order!.endTime);
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    imageUrlController.dispose();
    logoUrlController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    addressController.dispose();
    beginTimeController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
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
                    inputFormatters: [LengthLimitingTextInputFormatter(256)],
                    maxLength: 256,
                    maxLines: 5,
                  ),
                  ImageUploader(
                    imageUrl: imageUrlController.text,
                    label: 'Фото:',
                    height: 134,
                    onImageUploaded: (value) {
                      print(value);
                      setState(() {
                        imageUrlController.text = value;
                      });
                    },
                  ),
                  ImageUploader(
                    imageUrl: logoUrlController.text,
                    label: 'Логотип:',
                    onImageUploaded: (value) {
                      setState(() {
                        logoUrlController.text = value;
                      });
                    },
                  ),
                  PrimaryTextField(
                    textEditingController: descriptionController,
                    label: 'Описание:',
                    hintText: 'Техническое задание на создание...',
                    inputFormatters: [LengthLimitingTextInputFormatter(1024)],
                    maxLength: 1024,
                    maxLines: 12,
                  ),
                  PrimaryTextField(
                    textEditingController: priceController,
                    label: 'Стоимость:',
                    hintText: '25 000',
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: [
                      MoneyInputFormatter(),
                    ],
                  ),
                  PrimaryTextField(
                    textEditingController: addressController,
                    label: 'Место оказания услуги:',
                    hintText: 'г. Ярославль, ул. Урочская 112',
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    maxLength: 100,
                    maxLines: 2,
                    textCapitalization: TextCapitalization.none,
                  ),
                  SizedBox(
                    child: DateSelector(
                      beginTimeController: beginTimeController,
                      endTimeController: endTimeController,
                    ),
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
                            .parseUtc(beginTimeController.text);
                        final endDate = DateFormat('dd.MM.yyyy')
                            .parseUtc(endTimeController.text);

                        if (widget.order == null) {
                          final order = OrderCreate(
                            title: titleController.text,
                            price: priceController.text.parsePrice(),
                            imageUrl:
                                imageUrlController.text.startsWith(baseUrl)
                                    ? null
                                    : imageUrlController.text,
                            logoUrl: logoUrlController.text.startsWith(baseUrl)
                                ? null
                                : logoUrlController.text,
                            description: descriptionController.text,
                            address: addressController.text,
                            beginTime: beginDate,
                            endTime: endDate,
                          );
                          createOrder(order);
                        } else {
                          final order = OrderUpdate(
                            title: titleController.text,
                            price: priceController.text.parsePrice(),
                            imageUrl:
                                imageUrlController.text.startsWith(baseUrl)
                                    ? imageUrlController.text
                                    : null,
                            logoUrl: logoUrlController.text.startsWith(baseUrl)
                                ? logoUrlController.text
                                : null,
                            description: descriptionController.text,
                            address: addressController.text,
                            beginTime: beginDate,
                            endTime: endDate,
                          );
                          updateOrder(order);
                        }
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    child: Text(widget.order == null
                        ? 'Создать заказ'
                        : 'Сохранить изменения'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
