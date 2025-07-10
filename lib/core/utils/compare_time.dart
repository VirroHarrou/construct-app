import 'package:construct/generated/l10n.dart';

String getComparedTime(DateTime dateTime, S l10n) {
  final now = DateTime.now();
  final isPast = dateTime.isBefore(now);
  final duration = isPast ? now.difference(dateTime) : dateTime.difference(now);
  final absoluteDuration = duration.abs();

  if (absoluteDuration.inSeconds < 20) {
    return isPast
        ? l10n.justNow
        : absoluteDuration.inSeconds < 5
            ? l10n.justNow
            : l10n.soon;
  } else if (absoluteDuration.inMinutes < 1) {
    return _formatUnit(l10n, isPast, absoluteDuration.inSeconds, 'second');
  } else if (absoluteDuration.inHours < 1) {
    return _formatUnit(l10n, isPast, absoluteDuration.inMinutes, 'minute');
  } else if (absoluteDuration.inDays < 1) {
    return _formatUnit(l10n, isPast, absoluteDuration.inHours, 'hour');
  } else if (absoluteDuration.inDays < 7) {
    return _formatUnit(l10n, isPast, absoluteDuration.inDays, 'day');
  } else if (absoluteDuration.inDays < 30) {
    final weeks = (absoluteDuration.inDays / 7).floor();
    return _formatUnit(l10n, isPast, weeks, 'week');
  } else if (absoluteDuration.inDays < 365) {
    final months = (absoluteDuration.inDays / 30).floor();
    return _formatUnit(l10n, isPast, months, 'month');
  } else {
    final years = (absoluteDuration.inDays / 365).floor();
    return _formatUnit(l10n, isPast, years, 'year');
  }
}

String _formatUnit(S l10n, bool isPast, int value, String unitKey) {
  final unitMap = {
    'second': l10n.unitSecond(value),
    'minute': l10n.unitMinute(value),
    'hour': l10n.unitHour(value),
    'day': l10n.unitDay(value),
    'week': l10n.unitWeek(value),
    'month': l10n.unitMonth(value),
    'year': l10n.unitYear(value),
  };

  return isPast
      ? l10n.pastTime(unitMap[unitKey]!)
      : l10n.futureTime(unitMap[unitKey]!);
}
