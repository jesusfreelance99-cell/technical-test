import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonapp/core/theme/main_theme_export.dart';

///1. Clase para manejar los tamaños de fuente de la aplicacion Y los estilos de fuente
class MainFontTheme {
  //google font
  static TextStyle typeFont = GoogleFonts.nunito();

  static const double fontSize = 15.0;
  static const double fontSizeSmall = 12.0;
  static const double fontSizeLarge = 18.0;
  static const double fontSizeExtraLarge = 24.0;
  static const double fontSizeExtraSmall = 10.0;

  //estilos para fuentes dark y light
  static TextTheme lightThemeFont = TextTheme(
    displayLarge: typeFont.copyWith(
      fontSize: 45,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.secondaryColor,
    ),
    displayMedium: typeFont.copyWith(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.secondaryColor,
    ),
    displaySmall: typeFont.copyWith(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.secondaryColor,
    ),
    headlineLarge: typeFont.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.secondaryColor,
    ),
    headlineMedium: typeFont.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.secondaryColor,
    ),
    headlineSmall: typeFont.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.secondaryColor,
    ),
    titleLarge: typeFont.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.secondaryColor,
    ),
    titleMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.secondaryColor,
    ),
    titleSmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.secondaryColor,
    ),
    bodyLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: ColorPaletteTheme.secondaryColor,
    ),
    bodyMedium: typeFont.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      color: ColorPaletteTheme.secondaryColor,
    ),
    bodySmall: typeFont.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      color: ColorPaletteTheme.secondaryColor,
    ),
    labelLarge: typeFont.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: ColorPaletteTheme.secondaryColor,
    ),
    labelMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: ColorPaletteTheme.secondaryColor,
    ),
    labelSmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: ColorPaletteTheme.secondaryColor,
    ),
  );

  /// Estilos para fuentes dark
  static TextTheme darkThemeFont = TextTheme(
    displayLarge: typeFont.copyWith(
      fontSize: 45,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.primaryColor,
    ),
    displayMedium: typeFont.copyWith(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.primaryColor,
    ),
    displaySmall: typeFont.copyWith(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.primaryColor,
    ),
    headlineLarge: typeFont.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.primaryColor,
    ),
    headlineMedium: typeFont.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.primaryColor,
    ),
    headlineSmall: typeFont.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.primaryColor,
    ),
    titleLarge: typeFont.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.primaryColor,
    ),
    titleMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.primaryColor,
    ),
    titleSmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: ColorPaletteTheme.primaryColor,
    ),
    bodyLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: ColorPaletteTheme.primaryColor,
    ),
    bodyMedium: typeFont.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      color: ColorPaletteTheme.primaryColor,
    ),
    bodySmall: typeFont.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      color: ColorPaletteTheme.primaryColor,
    ),
    labelLarge: typeFont.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: ColorPaletteTheme.primaryColor,
    ),
    labelMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: ColorPaletteTheme.primaryColor,
    ),
    labelSmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: ColorPaletteTheme.primaryColor,
    ),
  );
}
