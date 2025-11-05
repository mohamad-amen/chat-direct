import "package:flutter/material.dart";

class AppTheme {
  AppTheme._();

  // Colors
  static Color primary = const Color(0xFF1FAD36);
  static Color darkPrimary = const Color(0xFF1B9930);
  static Color lightPrimary = const Color(0xFF25D443);

  static Color background = const Color(0xFF212121);
  static Color lightBackground = const Color(0xFFBDBDBD);

  static Color border = const Color(0xFFD6D6D6);

  static Color text = const Color(0xFFE6E6E6);
  static Color secondaryText = const Color(0xFFCCCCCC);

  static Color error = const Color(0xFFF44336);
  static Color success = const Color(0xFF4CAF50);

  // Themes
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: text,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: secondaryText,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        )),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primary,
      selectionColor: primary.withValues(alpha: 0.4),
      selectionHandleColor: primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: border,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppTheme.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppTheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppTheme.error),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(primary),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.dark,
    ),
  );
}
