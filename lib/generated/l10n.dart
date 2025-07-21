// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `construct`
  String get appTitle {
    return Intl.message(
      'construct',
      name: 'appTitle',
      desc: 'The title of the application',
      args: [],
    );
  }

  /// `Save changes`
  String get saveChanges {
    return Intl.message(
      'Save changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Address:`
  String get address {
    return Intl.message('Address:', name: 'address', desc: '', args: []);
  }

  /// `Description:`
  String get description {
    return Intl.message(
      'Description:',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `FCs:`
  String get FCs {
    return Intl.message('FCs:', name: 'FCs', desc: '', args: []);
  }

  /// `Photo:`
  String get photo {
    return Intl.message('Photo:', name: 'photo', desc: '', args: []);
  }

  /// `just now`
  String get justNow {
    return Intl.message('just now', name: 'justNow', desc: '', args: []);
  }

  /// `soon`
  String get soon {
    return Intl.message('soon', name: 'soon', desc: '', args: []);
  }

  /// `{unit} ago`
  String pastTime(Object unit) {
    return Intl.message(
      '$unit ago',
      name: 'pastTime',
      desc: 'Past time format',
      args: [unit],
    );
  }

  /// `in {unit}`
  String futureTime(Object unit) {
    return Intl.message('in $unit', name: 'futureTime', desc: '', args: [unit]);
  }

  /// `{count, plural, one{1 second} other{{count} seconds}}`
  String unitSecond(num count) {
    return Intl.plural(
      count,
      one: '1 second',
      other: '$count seconds',
      name: 'unitSecond',
      desc: 'Second unit with count',
      args: [count],
    );
  }

  /// `{count, plural, one{1 minute} other{{count} minutes}}`
  String unitMinute(num count) {
    return Intl.plural(
      count,
      one: '1 minute',
      other: '$count minutes',
      name: 'unitMinute',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{1 hour} other{{count} hours}}`
  String unitHour(num count) {
    return Intl.plural(
      count,
      one: '1 hour',
      other: '$count hours',
      name: 'unitHour',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{1 day} other{{count} days}}`
  String unitDay(num count) {
    return Intl.plural(
      count,
      one: '1 day',
      other: '$count days',
      name: 'unitDay',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{1 week} other{{count} weeks}}`
  String unitWeek(num count) {
    return Intl.plural(
      count,
      one: '1 week',
      other: '$count weeks',
      name: 'unitWeek',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{1 month} other{{count} months}}`
  String unitMonth(num count) {
    return Intl.plural(
      count,
      one: '1 month',
      other: '$count months',
      name: 'unitMonth',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{1 year} other{{count} years}}`
  String unitYear(num count) {
    return Intl.plural(
      count,
      one: '1 year',
      other: '$count years',
      name: 'unitYear',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{1 view} other{{count} views}}`
  String viewsCount(num count) {
    return Intl.plural(
      count,
      one: '1 view',
      other: '$count views',
      name: 'viewsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Hi, {userName}, you want `
  String welcomePhrase(Object userName) {
    return Intl.message(
      'Hi, $userName, you want ',
      name: 'welcomePhrase',
      desc: '',
      args: [userName],
    );
  }

  /// `create order?`
  String get createOrderQ {
    return Intl.message(
      'create order?',
      name: 'createOrderQ',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message('Orders', name: 'orders', desc: '', args: []);
  }

  /// `Main`
  String get main {
    return Intl.message('Main', name: 'main', desc: '', args: []);
  }

  /// `Chats`
  String get chats {
    return Intl.message('Chats', name: 'chats', desc: '', args: []);
  }

  /// `Phonenumber`
  String get phoneNumber {
    return Intl.message('Phonenumber', name: 'phoneNumber', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Repeat password`
  String get repeatPassword {
    return Intl.message(
      'Repeat password',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Не зарегистрирован? `
  String get notHaveAccount {
    return Intl.message(
      'Не зарегистрирован? ',
      name: 'notHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Создать аккаунт`
  String get createAccount {
    return Intl.message(
      'Создать аккаунт',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get singIn {
    return Intl.message('Войти', name: 'singIn', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
