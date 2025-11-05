import "dart:ui";
import "package:chat_direct/theme/color_palettes/color_palette_interface.dart";

class DarkColorPalette implements ColorPalette {
  @override
  Color get primary => const Color(0xFF1FAD36);
  @override
  Color get darkPrimary => const Color(0xFF1B9930);
  @override
  Color get lightPrimary => const Color(0xFF25D443);

  @override
  Color get background => const Color(0xFF212121);
  @override
  Color get lightBackground => const Color(0xFFBDBDBD);

  @override
  Color get border => const Color(0xFFD9D9D9);

  @override
  Color get text => const Color(0xFFF2F2F2);
  @override
  Color get secondaryText => const Color(0xFFE6E6E6);

  @override
  Color get error => const Color(0xFFF44336);
  @override
  Color get success => const Color(0xFF4CAF50);
}
