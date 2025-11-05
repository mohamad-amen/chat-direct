import "dart:ui";

abstract class ColorPalette {
  Color get primary;
  Color get darkPrimary;
  Color get lightPrimary;

  Color get background;
  Color get lightBackground;

  Color get border;

  Color get text;
  Color get secondaryText;

  Color get error;
  Color get success;
}
