import 'package:flutter/material.dart';

class ColorManager {
  static const primaryColorValue = 0xFF00A6AC;

  // Primary Colors
  static const Color primary = Color(0XFFFF9052);
  static Color primaryAcent = const Color(0XFFFF571F).withOpacity(.05);

  static const Color primaryVariant = Color(0xFF1EC4F8);
  static const Color primaryVariantAcent = Color(0xFFB4DBFF);

  // Secondary Colors
  static Color secondary = const Color(0xFFFDF9F7);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);

    static Color get galssWhite => const Color.fromARGB(24, 255, 255, 255);

  static const Color black = Color(0xFF000000);
  static Color grey = const Color(0xFF86929E).withOpacity(.25);

  // Background Colors
  static const Color background = Color(0xFFFAFFFF);
  static Color black50 = const Color(0xFF000000).withOpacity(.5);
  // static const Color surface = Color(0xFFFFFFFF);

  // Error Colors
  static const Color error = Color(0xFFE25C5C);
  static const Color error2 = Color(0xFFD80027);
  static Color errorAccent = const Color(0xFFFF0000).withOpacity(.2);

  // Success Colors
  static const Color success = Color(0xFF00A523);
  static const Color success2 = Color(0xFF00FF0A);
  static Color successAcent = const Color(0xFF00FF0A).withOpacity(.2);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0x0ff5e5f6);
  static const Color textSecondary2 = Color(0xFF707070);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textDefault = Color(0xFF87898E);
  static Color textHint = const Color(0xFF86929E).withOpacity(.6);

  static const Color defaultBorder = Color(0xFFDFDFE6);
  static const Color focusInputBorder = Color(0xFFAAAAAA);

  static const MaterialColor primarySwatch = MaterialColor(
    primaryColorValue,
    <int, Color>{
      50: Color(0xFFE0F7F8), // Lightest shade
      100: Color(0xFFB3ECEE),
      200: Color(0xFF80E0E3),
      300: Color(0xFF4DD3D7),
      400: Color(0xFF26C9CE),
      500: Color(primaryColorValue), // Original color
      600: Color(0xFF009DA3),
      700: Color(0xFF009298),
      800: Color(0xFF00888E),
      900: Color(0xFF00757B), // Darkest shade
    },
  );
}
