// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(unit) => "in ${unit}";

  static String m1(unit) => "${unit} ago";

  static String m2(count) =>
      "${Intl.plural(count, one: '1 day', other: '${count} days')}";

  static String m3(count) =>
      "${Intl.plural(count, one: '1 hour', other: '${count} hours')}";

  static String m4(count) =>
      "${Intl.plural(count, one: '1 minute', other: '${count} minutes')}";

  static String m5(count) =>
      "${Intl.plural(count, one: '1 month', other: '${count} months')}";

  static String m6(count) =>
      "${Intl.plural(count, one: '1 second', other: '${count} seconds')}";

  static String m7(count) =>
      "${Intl.plural(count, one: '1 week', other: '${count} weeks')}";

  static String m8(count) =>
      "${Intl.plural(count, one: '1 year', other: '${count} years')}";

  static String m9(count) =>
      "${Intl.plural(count, one: '1 view', other: '${count} views')}";

  static String m10(userName) => "Hi, ${userName}, you want ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "FCs": MessageLookupByLibrary.simpleMessage("FCs:"),
    "address": MessageLookupByLibrary.simpleMessage("Address:"),
    "appTitle": MessageLookupByLibrary.simpleMessage("construct"),
    "chats": MessageLookupByLibrary.simpleMessage("Chats"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Создать аккаунт"),
    "createOrderQ": MessageLookupByLibrary.simpleMessage("create order?"),
    "description": MessageLookupByLibrary.simpleMessage("Description:"),
    "futureTime": m0,
    "justNow": MessageLookupByLibrary.simpleMessage("just now"),
    "main": MessageLookupByLibrary.simpleMessage("Main"),
    "notHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Не зарегистрирован? ",
    ),
    "orders": MessageLookupByLibrary.simpleMessage("Orders"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "pastTime": m1,
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phonenumber"),
    "photo": MessageLookupByLibrary.simpleMessage("Photo:"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage("Repeat password"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("Save changes"),
    "singIn": MessageLookupByLibrary.simpleMessage("Войти"),
    "soon": MessageLookupByLibrary.simpleMessage("soon"),
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
