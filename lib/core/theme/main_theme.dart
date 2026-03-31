import 'package:flutter/material.dart';
import 'package:pokemonapp/core/theme/main_theme_export.dart';
import 'package:pokemonapp/core/theme/font_theme.dart';

///1. Clase para manejar los temas principales
class MainTheme {
  //*==========MODO CLARO=========
  static final ThemeData whiteTheme = ThemeData.light().copyWith(
    appBarTheme: MainAppbarTheme.lightThemeAppBar,
    primaryColor: ColorPaletteTheme.primaryColor,
    highlightColor: ColorPaletteTheme.secondaryColor,
    floatingActionButtonTheme: MainButtonTheme.floatingActionLight,
    colorScheme: ColorScheme.light(primary: ColorPaletteTheme.primaryColor),
    textTheme: MainFontTheme.lightThemeFont,
    disabledColor: ColorPaletteTheme
        .primaryColorGrey, //establece el color para los elementos desactivados
    dividerColor:
        ColorPaletteTheme.primaryColorLight, //color del widget Divider()
    scaffoldBackgroundColor:
        ColorPaletteTheme.primaryColor, //rstablece el color para el "scaffold"
    visualDensity: VisualDensity
        .adaptivePlatformDensity, //adaptando a diferentes tamaños y resoluciones de pantalla.
    unselectedWidgetColor:
        ColorPaletteTheme.primaryColorGrey, //widgets no seleccionados
    scrollbarTheme:
        ScrollbarThemeData(
          radius: const Radius.circular(10),
          thumbColor: WidgetStatePropertyAll(
            ColorPaletteTheme.accentColor.withAlpha((0.5 * 255).toInt()),
          ),
          trackColor: WidgetStatePropertyAll(ColorPaletteTheme.accentColor),
        ).copyWith(
          thumbColor: WidgetStateProperty.all(ColorPaletteTheme.accentColor),
        ),

    iconTheme: IconThemeData(color: ColorPaletteTheme.accentColor, size: 20),
    sliderTheme: SliderThemeData(
      activeTrackColor: ColorPaletteTheme.accentColor,
      thumbColor: ColorPaletteTheme.accentColor,
      overlayColor: ColorPaletteTheme.accentColor,
      inactiveTrackColor: ColorPaletteTheme.accentColor.withAlpha(
        (0.2 * 255).toInt(),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorPaletteTheme.accentColor,
    ),
    outlinedButtonTheme: MainButtonTheme.outlinedButtonLight,

    elevatedButtonTheme: MainButtonTheme.elevatedButtonLight,
    textButtonTheme: MainButtonTheme.textButtonLight,
    iconButtonTheme: MainButtonTheme.iconButtonLight,
    dividerTheme: DividerThemeData(color: ColorPaletteTheme.primaryColorLight),
    splashColor: ColorPaletteTheme.secondaryColorLight.withAlpha(
      (0.2 * 255).toInt(),
    ),
    splashFactory: InkSparkle.splashFactory,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
    // navigationBarTheme: NavBarMainThemeData.navigationBarLight,
  );

  //*==========MODO OSCURO=========*
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: MainAppbarTheme.darkThemeAppBar,
    primaryColor: ColorPaletteTheme.secondaryColor,
    highlightColor: ColorPaletteTheme.secondaryColor,
    floatingActionButtonTheme: MainButtonTheme.floatingActionDark,
    colorScheme: ColorScheme.dark(primary: ColorPaletteTheme.primaryColor),
    textTheme: MainFontTheme.darkThemeFont,
    disabledColor: ColorPaletteTheme
        .primaryColorGrey, //establece el color para los elementos desactivados
    dividerColor:
        ColorPaletteTheme.secondaryColorDark, //color del widget Divider()
    scaffoldBackgroundColor: ColorPaletteTheme
        .secondaryColor, //rstablece el color para el "scaffold"
    visualDensity: VisualDensity
        .adaptivePlatformDensity, //adaptando a diferentes tamaños y resoluciones de pantalla.
    unselectedWidgetColor:
        ColorPaletteTheme.secondaryColorDark, //widgets no seleccionados
    scrollbarTheme:
        ScrollbarThemeData(
          radius: const Radius.circular(10),
          thumbColor: WidgetStatePropertyAll(
            ColorPaletteTheme.accentColor.withAlpha((0.5 * 255).toInt()),
          ),
          trackColor: WidgetStatePropertyAll(ColorPaletteTheme.accentColor),
        ).copyWith(
          thumbColor: WidgetStateProperty.all(ColorPaletteTheme.accentColor),
        ),

    iconTheme: IconThemeData(color: ColorPaletteTheme.accentColor, size: 20),
    sliderTheme: SliderThemeData(
      activeTrackColor: ColorPaletteTheme.accentColor,
      thumbColor: ColorPaletteTheme.accentColor,
      overlayColor: ColorPaletteTheme.accentColor,
      inactiveTrackColor: ColorPaletteTheme.accentColor.withAlpha(
        (0.2 * 255).toInt(),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorPaletteTheme.accentColor,
    ),
    outlinedButtonTheme: MainButtonTheme.outlinedButtonDark,

    elevatedButtonTheme: MainButtonTheme.elevatedButtonDark,
    textButtonTheme: MainButtonTheme.textButtonDark,
    iconButtonTheme: MainButtonTheme.iconButtonDark,
    dividerTheme: DividerThemeData(color: ColorPaletteTheme.primaryColorLight),
    splashColor: ColorPaletteTheme.primaryColorGreySecondary.withAlpha(
      (0.2 * 255).toInt(),
    ),
    splashFactory: InkSparkle.splashFactory,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
    // navigationBarTheme: NavBarMainThemeData.navigationBarDark,
  );
}
