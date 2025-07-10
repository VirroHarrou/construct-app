// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(unit) => "через ${unit}";

  static String m1(unit) => "${unit} назад";

  static String m2(count) =>
      "${Intl.plural(count, one: '1 день', few: '${count} дня', many: '${count} дней', other: '${count} дня')}";

  static String m3(count) =>
      "${Intl.plural(count, one: '1 час', few: '${count} часа', many: '${count} часов', other: '${count} часа')}";

  static String m4(count) =>
      "${Intl.plural(count, one: '1 минуту', few: '${count} минуты', many: '${count} минут', other: '${count} минуты')}";

  static String m5(count) =>
      "${Intl.plural(count, one: '1 месяц', few: '${count} месяца', many: '${count} месяцев', other: '${count} месяца')}";

  static String m6(count) =>
      "${Intl.plural(count, one: '1 секунду', few: '${count} секунды', many: '${count} секунд', other: '${count} секунды')}";

  static String m7(count) =>
      "${Intl.plural(count, one: '1 неделю', few: '${count} недели', many: '${count} недель', other: '${count} недели')}";

  static String m8(count) =>
      "${Intl.plural(count, one: '1 год', few: '${count} года', many: '${count} лет', other: '${count} года')}";

  static String m9(count) =>
      "${Intl.plural(count, one: '1 Просмотр', few: '${count} Просмотра', many: '${count} Просмотров', other: '${count} Просмотра')}";

  static String m10(userName) => "Привет, ${userName}, хочешь ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "FCs": MessageLookupByLibrary.simpleMessage("ФИО:"),
    "address": MessageLookupByLibrary.simpleMessage("Адресс"),
    "appTitle": MessageLookupByLibrary.simpleMessage("construct"),
    "chats": MessageLookupByLibrary.simpleMessage("Чаты"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Создать аккаунт"),
    "createOrderQ": MessageLookupByLibrary.simpleMessage("создать заказ?"),
    "description": MessageLookupByLibrary.simpleMessage("Описание:"),
    "futureTime": m0,
    "justNow": MessageLookupByLibrary.simpleMessage("только что"),
    "main": MessageLookupByLibrary.simpleMessage("Главная"),
    "notHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Не зарегистрирован? ",
    ),
    "orders": MessageLookupByLibrary.simpleMessage("Заказы"),
    "password": MessageLookupByLibrary.simpleMessage("Пароль"),
    "pastTime": m1,
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Номер телефона"),
    "photo": MessageLookupByLibrary.simpleMessage("Фото:"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage("Повторите пароль"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("Сохранить изменения"),
    "singIn": MessageLookupByLibrary.simpleMessage("Войти"),
    "soon": MessageLookupByLibrary.simpleMessage("скоро"),
    "unitDay": m2,
    "unitHour": m3,
    "unitMinute": m4,
    "unitMonth": m5,
    "unitSecond": m6,
    "unitWeek": m7,
    "unitYear": m8,
    "viewsCount": m9,
    "welcomePhrase": m10,
  };
}
