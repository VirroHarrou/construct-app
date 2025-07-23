import 'dart:io';

import 'package:construct/services/token/token_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _preventScreenshot();

  runApp(
    ProviderScope(
      overrides: [
        tokenStorageServiceProvider.overrideWithValue(TokenStorageService()),
      ],
      child: MyApp(),
    ),
  );
}

Future<void> _preventScreenshot() async {
  if (Platform.isAndroid) {
    try {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    } catch (e) {
      debugPrint("Ошибка блокировки скриншотов: $e");
    }
  }
}
