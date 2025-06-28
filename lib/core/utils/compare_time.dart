String getComparedTime(DateTime dateTime) {
  final now = DateTime.now();
  final isPast = dateTime.isBefore(now);
  final duration = isPast ? now.difference(dateTime) : dateTime.difference(now);
  final absoluteDuration = duration.abs();

  // Функция для форматирования результата
  String formatResult(int value, String unit) {
    final plural = value == 1 ? '' : 's';
    return isPast ? "$value $unit$plural ago" : "in $value $unit$plural";
  }

  // Обработка временных диапазонов
  if (absoluteDuration.inSeconds < 20) {
    return isPast ? "just now" : "soon";
  } else if (absoluteDuration.inMinutes < 1) {
    return formatResult(absoluteDuration.inSeconds, "second");
  } else if (absoluteDuration.inHours < 1) {
    return formatResult(absoluteDuration.inMinutes, "minute");
  } else if (absoluteDuration.inDays < 1) {
    return formatResult(absoluteDuration.inHours, "hour");
  } else if (absoluteDuration.inDays < 7) {
    return formatResult(absoluteDuration.inDays, "day");
  } else if (absoluteDuration.inDays < 30) {
    final weeks = (absoluteDuration.inDays / 7).floor();
    return formatResult(weeks, "week");
  } else if (absoluteDuration.inDays < 365) {
    final months = (absoluteDuration.inDays / 30).floor();
    return formatResult(months, "month");
  } else {
    final years = (absoluteDuration.inDays / 365).floor();
    return formatResult(years, "year");
  }
}
