import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MoneyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;

    // Разрешаем только цифры, запятые и точки
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^\d.,]'), '');

    // Заменяем запятые на точки (для единого формата)
    cleanedText = cleanedText.replaceAll(',', '.');

    // Удаляем лишние точки (оставляем только первую)
    final dotIndex = cleanedText.indexOf('.');
    if (dotIndex != -1) {
      final beforeDot = cleanedText.substring(0, dotIndex + 1);
      final afterDot = cleanedText.substring(dotIndex + 1).replaceAll('.', '');
      cleanedText = beforeDot + afterDot;
    }

    // Разделяем на целую и дробную части
    final parts = cleanedText.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '';

    // Удаляем ведущие нули (кроме случая "0.")
    if (integerPart.length > 1) {
      integerPart = integerPart.replaceFirst(RegExp(r'^0+'), '');
      if (integerPart.isEmpty) integerPart = '0';
    }

    // Ограничение целой части (макс. 8 цифр)
    if (integerPart.length > 8) {
      integerPart = integerPart.substring(0, 8);
    }

    // Ограничение дробной части (макс. 2 символа)
    if (decimalPart.length > 2) {
      decimalPart = decimalPart.substring(0, 2);
    }

    // Форматирование целой части с разделителями
    String formattedInteger = '';
    if (integerPart.isNotEmpty) {
      final numValue = int.tryParse(integerPart) ?? 0;
      formattedInteger = NumberFormat('#,###', 'ru_RU').format(numValue);
    }

    // Собираем финальный текст
    String newText = formattedInteger;
    if (decimalPart.isNotEmpty || cleanedText.endsWith('.')) {
      newText += '.$decimalPart';
    }

    // Корректировка курсора
    int cursorPosition = newText.length;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
