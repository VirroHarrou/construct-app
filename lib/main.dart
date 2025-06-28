import 'package:construct/services/token/token_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: [
        tokenStorageServiceProvider.overrideWithValue(TokenStorageService()),
      ],
      child: MyApp(),
    ),
  );
}
