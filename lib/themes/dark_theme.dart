import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_colors.dart';

ThemeData darkTheme() {
  ColorScheme colorScheme = CustomColors.darkColorScheme;
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: colorScheme,
    dialogBackgroundColor: CustomColors.black,
    splashColor: colorScheme.primary.withOpacity(0.15),
    highlightColor: colorScheme.primary.withOpacity(0.15),
    scaffoldBackgroundColor: colorScheme.background,
    textTheme: GoogleFonts.rubikTextTheme().apply(
      bodyColor: CustomColors.dullWhite,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.raleway(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
