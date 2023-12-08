import 'package:flutter/material.dart';

class CustomColors {
  static const Color black = Color(0xFF1C212A);
  static const Color silverWhite = Color(0xFFF4F4F5);
  static const Color silverGrey = Color(0xFFEEEEEE);

  static const Color lightBlack = Color(0xFF2C3333);
  static Color dullWhite = const Color(0xFFFFFFFF).withOpacity(0.87);

  static const Color blueBlack = Color(0xFF16213E);
  static const Color lightOrange = Color(0xFFFC7A69);
  static const Color skinOrange = Color(0xFFFEF4F3);
  static const Color red = Color(0xFFE94560);
  static const Color yellowBrown = Color(0xffFFD8A9);

  static const Color deepBlue = Color(0xFF0054C6);

  static ColorScheme lightColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: CustomColors.deepBlue,
    primary: CustomColors.deepBlue,
    onPrimary: CustomColors.silverWhite,
  );

  static ColorScheme darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: CustomColors.deepBlue,
    primary: CustomColors.deepBlue,
    onPrimary: CustomColors.silverWhite,
  );
}
