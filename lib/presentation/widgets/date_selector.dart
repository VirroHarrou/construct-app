import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DateSelector extends StatelessWidget {
  final TextEditingController beginTimeController;
  final TextEditingController endTimeController;

  const DateSelector({
    super.key,
    required this.beginTimeController,
    required this.endTimeController,
  });

  @override
  Widget build(BuildContext context) {
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
                  TextFormField(
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
                  TextFormField(
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
}
