import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokemonapp/core/theme/main_theme_export.dart';

///1. Widget para aplicar efecto de gradiente a las pantallas
class GradientEffectForScreens extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final bool safeArea;
  final List<Color>? colors;
  final bool resizeToAvoidBottomInset;
  const GradientEffectForScreens({
    super.key,
    this.appBar,
    required this.child,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.safeArea = true,
    this.colors,
    this.resizeToAvoidBottomInset = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Stack(
        children: [
          //1. Efecto de gradiente
          Container(
            height: size.height * 0.7,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:
                    colors ??
                    [
                      ColorPaletteTheme.accentColor, // Azul arriba
                      ColorPaletteTheme.accentColorLight.withValues(alpha: 0.0),
                    ],
                stops: [0.0, 0.75],
              ),
            ),
          ),
          //2. Efecto de Ruido
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.black.withValues(alpha: 0.1)),
          ),

          //3. child
          if (safeArea) SafeArea(child: child) else child,
        ],
      ),
    );
  }
}

///2. Widget para aplicar efecto de gradiente a la parte inferior de la pantalla
class GradientButtonForScreens extends StatelessWidget {
  final AppBar? appBar;
  final Widget child;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;
  const GradientButtonForScreens({
    super.key,
    this.appBar,
    required this.child,
    this.extendBody = true,
    this.extendBodyBehindAppBar = true,
    this.resizeToAvoidBottomInset = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Stack(
        children: [
          //1. Efecto de gradiente
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.7,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    ColorPaletteTheme.accentColor, // Azul arriba
                    ColorPaletteTheme.accentColorLight.withValues(alpha: 0.0),
                  ],
                  stops: [0.0, 0.75],
                ),
              ),
            ),
          ),
          //2. Efecto de Ruido
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.black.withValues(alpha: 0.1)),
          ),

          //3. child
          SafeArea(child: child),
        ],
      ),
    );
  }
}

///1. EFECTO GRADIENT PARA LOS CARDS O CONTAINER
class CardGradientEffectComponent extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget child;
  final List<Color>? colors;
  const CardGradientEffectComponent({
    super.key,
    this.padding,
    required this.child,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding:
          padding ??
          EdgeInsets.symmetric(
            horizontal: size.width * .04,
            vertical: size.height * .03,
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusTheme.borderRadius),
        // border: Border.all(color: ColorPaletteTheme.primaryColor, width: 1.5),
        gradient: LinearGradient(
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
          colors:
              colors ??
              [
                ColorPaletteTheme.primaryColorLight,
                ColorPaletteTheme.whiteColor.withValues(alpha: 0.1),
              ],
        ),
      ),
      child: child,
    );
  }
}
