import "package:chat_direct/theme/color_palettes/color_palette_interface.dart";
import "package:flutter/material.dart";

ThemeData darkTheme(ColorPalette colorPalette) {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: colorPalette.background,
    textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: colorPalette.text,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorPalette.secondaryText,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        )),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: colorPalette.primary,
      selectionColor: colorPalette.primary.withValues(alpha: 0.4),
      selectionHandleColor: colorPalette.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: colorPalette.secondaryText,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorPalette.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorPalette.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorPalette.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorPalette.error),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(colorPalette.primary),
        foregroundColor: WidgetStateProperty.all(colorPalette.secondaryText),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: colorPalette.primary,
      brightness: Brightness.dark,
    ),
  );
}
