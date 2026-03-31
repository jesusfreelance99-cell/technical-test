import 'package:flutter/material.dart';
import 'package:pokemonapp/core/theme/main_theme_export.dart';
import 'package:pokemonapp/core/theme/font_theme.dart';

class MainAppbarTheme {
  static const double appBarHeight = 56.0;
  //fuente para el app bar
  static TextStyle fontType = MainFontTheme.typeFont;

  static AppBarThemeData lightThemeAppBar = AppBarThemeData(
    iconTheme: IconThemeData(color: ColorPaletteTheme.accentColor, size: 25),
    actionsIconTheme: IconThemeData(
      color: ColorPaletteTheme.accentColor,
      size: 25,
    ),
    foregroundColor: ColorPaletteTheme.transparent,
    backgroundColor: ColorPaletteTheme.transparent,
    shadowColor: ColorPaletteTheme.transparent,
    elevation: 0, //sombra
    centerTitle: true, //centrar titulo
    titleTextStyle: fontType.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.secondaryColor,
    ),
  );

  static AppBarThemeData darkThemeAppBar = AppBarThemeData(
    iconTheme: IconThemeData(color: ColorPaletteTheme.accentColor, size: 25),
    actionsIconTheme: IconThemeData(
      color: ColorPaletteTheme.accentColor,
      size: 25,
    ),
    foregroundColor: ColorPaletteTheme.secondaryColor,
    backgroundColor: ColorPaletteTheme.secondaryColor,
    shadowColor: ColorPaletteTheme.secondaryColor,
    elevation: 0, //sombra
    centerTitle: true, //centrar titulo
    titleTextStyle: fontType.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.primaryColor,
    ),
  );
}
