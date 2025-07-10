part of 'app.dart';

final _mainTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: Color(0xFF4285F4),
    onPrimary: Colors.white,
    secondary: Colors.black,
    onSecondary: Colors.white,
    surface: Color(0xFFF0F0F1),
    primaryContainer: Colors.white,
    onSecondaryContainer: Color(0xFFB8B8B8),
    secondaryContainer: Color(0xFF9EA6BE),
    onSurface: Colors.black,
    onSurfaceVariant: Color(0xFF9EA6BE),
    error: Color(0xFF711D1D),
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: WidgetStatePropertyAll(
        const Size(double.infinity, 54),
      ),
      alignment: Alignment.center,
      backgroundColor: WidgetStatePropertyAll<Color>(
        Color(0xFF4285F4),
      ),
      surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
      padding: WidgetStatePropertyAll(
        const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      textStyle: WidgetStatePropertyAll(
        const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      foregroundColor: WidgetStatePropertyAll(
        Colors.white,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide.none,
      )),
    ),
  ),
);
