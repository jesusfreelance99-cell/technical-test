import 'package:flutter/material.dart';
import 'package:pokemonapp/core/theme/main_theme_export.dart';
import 'package:pokemonapp/core/theme/font_theme.dart';

///1. Clase para manejar los estilos de los botones principales
class MainButtonTheme {
  //fuente para el app bar
  static TextStyle fontType = MainFontTheme.typeFont;

  //Modo claro
  static ElevatedButtonThemeData elevatedButtonLight = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shadowColor: ColorPaletteTheme.transparent,
      elevation: 0,
      textStyle: fontType.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: ColorPaletteTheme.primaryColor,
      ),
      foregroundColor: ColorPaletteTheme.primaryColor, //color de las letras */
      backgroundColor: ColorPaletteTheme.accentColor, //color del boton */
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BorderRadiusTheme.borderRadius),
      ),
    ),
  );
  //Boton con borde
  static OutlinedButtonThemeData outlinedButtonLight = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: fontType.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: ColorPaletteTheme.accentColor,
      ),
      backgroundColor: ColorPaletteTheme.transparent,
      surfaceTintColor: ColorPaletteTheme.accentColor, //
      disabledBackgroundColor: ColorPaletteTheme.primaryColorGrey,
      disabledForegroundColor: ColorPaletteTheme.primaryColorGrey,
      elevation: 0,
      shadowColor: ColorPaletteTheme.transparent,
      side: BorderSide(color: ColorPaletteTheme.accentColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BorderRadiusTheme.borderRadius),
        side: BorderSide(
          color: ColorPaletteTheme.accentColor,
        ), // Color del borde
      ),
    ),
  );
  //Boton de texto
  static TextButtonThemeData textButtonLight = TextButtonThemeData(
    style: TextButton.styleFrom(
      shadowColor: ColorPaletteTheme.secondaryColor.withAlpha(
        (0.5 * 255).toInt(),
      ),
      elevation: 0,
      textStyle: fontType.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: ColorPaletteTheme.accentColor,
      ),
      iconColor: ColorPaletteTheme.accentColor,
      foregroundColor: ColorPaletteTheme.accentColor,
    ),
  );

  static IconButtonThemeData iconButtonLight = IconButtonThemeData(
    style: ButtonStyle(
      elevation: const WidgetStatePropertyAll(0),
      shadowColor: WidgetStatePropertyAll(
        ColorPaletteTheme.accentColor.withAlpha((0.5 * 255).toInt()),
      ),
      foregroundColor: WidgetStatePropertyAll(
        ColorPaletteTheme.accentColor,
      ), //color de las letras */

      iconSize: WidgetStateProperty.all(25),
      iconColor: WidgetStateProperty.all(ColorPaletteTheme.accentColor),
    ),
  );

  // Tema claro para FloatingActionButton
  static FloatingActionButtonThemeData floatingActionLight =
      FloatingActionButtonThemeData(
        backgroundColor: ColorPaletteTheme.primaryColor,
        foregroundColor: ColorPaletteTheme.accentColor,
        elevation: 6,
      );

  //Modo oscuro
  static ElevatedButtonThemeData elevatedButtonDark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shadowColor: ColorPaletteTheme.transparent,
      elevation: 0,
      textStyle: fontType.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: ColorPaletteTheme.primaryColor,
      ),
      foregroundColor: ColorPaletteTheme.primaryColor, //color de las letras */
      backgroundColor: ColorPaletteTheme.accentColor, //color del boton */
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BorderRadiusTheme.borderRadius),
      ),
    ),
  );

  static OutlinedButtonThemeData outlinedButtonDark = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: fontType.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: ColorPaletteTheme.accentColor,
      ),
      backgroundColor: ColorPaletteTheme.transparent,
      surfaceTintColor: ColorPaletteTheme.accentColor, //
      disabledBackgroundColor: ColorPaletteTheme.primaryColorGrey,
      disabledForegroundColor: ColorPaletteTheme.primaryColorGrey,
      elevation: 0,
      shadowColor: ColorPaletteTheme.transparent,
      side: BorderSide(color: ColorPaletteTheme.accentColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BorderRadiusTheme.borderRadius),
        side: BorderSide(
          color: ColorPaletteTheme.accentColor, // Color del borde
        ),
      ),
    ),
  );

  static TextButtonThemeData textButtonDark = TextButtonThemeData(
    style: TextButton.styleFrom(
      shadowColor: ColorPaletteTheme.secondaryColor.withAlpha(
        (0.5 * 255).toInt(),
      ),
      elevation: 0,
      textStyle: fontType.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: ColorPaletteTheme.accentColor,
      ),
      iconColor: ColorPaletteTheme.accentColor,
      foregroundColor: ColorPaletteTheme.accentColor,
    ),
  );

  static IconButtonThemeData iconButtonDark = IconButtonThemeData(
    style: ButtonStyle(
      elevation: const WidgetStatePropertyAll(0),
      shadowColor: WidgetStatePropertyAll(
        ColorPaletteTheme.accentColor.withAlpha((0.5 * 255).toInt()),
      ),
      foregroundColor: WidgetStatePropertyAll(
        ColorPaletteTheme.accentColor,
      ), //color de las letras */

      iconSize: WidgetStateProperty.all(25),
      iconColor: WidgetStateProperty.all(ColorPaletteTheme.accentColor),
    ),
  );

  // Tema oscuro para FloatingActionButton
  static FloatingActionButtonThemeData floatingActionDark =
      FloatingActionButtonThemeData(
        backgroundColor: ColorPaletteTheme.accentColor,
        foregroundColor: ColorPaletteTheme.secondaryColor,
        elevation: 6,
      );
}
