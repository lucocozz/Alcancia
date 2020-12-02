import 'package:flutter/material.dart';

const gPrimaryColor = const Color(0XFF4D4AEF);
const gSecondaryColor = const Color(0XFF458EF7);
const gWhiteAccent = const Color(0XFFECF2FE);
const gAccentColor = const Color(0XFF4D4AEF);
const gBackgroundColor = const Color(0XFF4D4AEF);

class Themes {
  static final ThemeData defaultTheme = _buildDefaultTheme();

  static ThemeData _buildDefaultTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      accentColor: gAccentColor,
      primaryColor: gPrimaryColor,
      backgroundColor: gBackgroundColor,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }
}
