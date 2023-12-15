import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_colors.dart';

ThemeData lightTheme() {
  ColorScheme colorScheme = CustomColors.lightColorScheme;
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.rubikTextTheme(),
    colorScheme: colorScheme,
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: GoogleFonts.raleway(),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: colorScheme.primaryContainer,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: CustomColors.black,
    ),
    iconTheme: IconThemeData(
      color: colorScheme.onBackground,
    ),
    splashColor: colorScheme.primary.withOpacity(0.15),
    highlightColor: colorScheme.primary.withOpacity(0.15),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: CustomColors.black,
      iconTheme: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return const IconThemeData(
              color: Colors.white,
            );
          }
          return null;
        },
      ),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.raleway(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: CustomColors.blueBlack,
      ),
    ),
    chipTheme: const ChipThemeData(
      shape: StadiumBorder(),
      side: BorderSide.none,
      backgroundColor: CustomColors.blueBlack,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 16,
      ),
      labelStyle: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
