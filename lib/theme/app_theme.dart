import "package:chat_direct/theme/color_palettes/color_palette_interface.dart";
import "package:chat_direct/theme/color_palettes/dark_color_palette.dart";
import "package:chat_direct/theme/themes/dark_theme.dart";
import "package:flutter/material.dart";

class AppTheme {
  AppTheme._();

  static ColorPalette colorPalette = DarkColorPalette();

  static ThemeData themeData = darkTheme(colorPalette);

  static ThemeMode themeMode = ThemeMode.dark;
}
