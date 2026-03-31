import 'dart:ui';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapp/core/theme/main_theme_export.dart';
import 'package:pokemonapp/features/pokemon/presentation/widgets/custom_loading_component.dart';

class CustomPrincipalButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Color? colorButton;
  final Color? colorText;
  final Function onPressed;
  final double? width;
  final double? height;
  const CustomPrincipalButton({
    super.key,
    required this.text,
    required this.isLoading,
    this.colorButton,
    this.colorText,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: width ?? size.width * .8,
      height: height ?? size.height * .06,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(colorButton),
          foregroundColor: WidgetStatePropertyAll(colorText),
        ),
        onPressed: isLoading ? null : () => onPressed(),
        child: isLoading
            ? CustomLoadingComponent()
            : Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                textScaler: TextScaler.noScaling,
              ),
      ),
    );
  }
}

class CustomButtonWithImageOutline extends StatelessWidget {
  final String text;
  final bool isLoading;
  final IconData? icon;
  final String? image;
  final Color? colorButton;
  final Color? colorText;
  final Function onPressed;
  final double? width;
  final double? height;
  final double? sizeIcon;
  const CustomButtonWithImageOutline({
    super.key,
    required this.text,
    required this.isLoading,
    this.icon,
    this.image,
    this.colorButton,
    this.colorText,
    required this.onPressed,
    this.width,
    this.height,
    this.sizeIcon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: width ?? size.width * .8,
          height: height ?? size.height * .06,
          decoration: BoxDecoration(
            color: ColorPaletteTheme.primaryColor.withValues(alpha: .1),
            borderRadius: BorderRadius.circular(BorderRadiusTheme.borderRadius),
          ),
          child: OutlinedButton(
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(colorText),

              side: WidgetStatePropertyAll(
                BorderSide(color: Colors.white, width: 1.5),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    BorderRadiusTheme.borderRadius,
                  ),
                ),
              ),
            ),
            onPressed: isLoading ? null : () => onPressed(),
            child: isLoading
                ? CustomLoadingComponent(color: colorText)
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) Icon(icon, size: sizeIcon ?? 20),
                      SizedBox(width: size.width * .02),
                      if (image != null) Image.asset(image!),
                      Expanded(
                        child: Text(
                          text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          textScaler: TextScaler.noScaling,
                          style: textStyle.bodyLarge!.copyWith(
                            color: ColorPaletteTheme.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class CustomPrincipalButtonWithBlurEffect extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Color? colorButton;
  final Color? colorText;
  final Function onPressed;
  final double? width;
  final double? height;
  const CustomPrincipalButtonWithBlurEffect({
    super.key,
    required this.text,
    required this.isLoading,
    this.colorButton,
    this.colorText,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: width ?? size.width * .8,
          height: height ?? size.height * .06,
          decoration: BoxDecoration(
            color: ColorPaletteTheme.primaryColor.withValues(alpha: .1),
            borderRadius: BorderRadius.circular(BorderRadiusTheme.borderRadius),
          ),
          child: SizedBox(
            width: width ?? size.width * .8,
            height: height ?? size.height * .06,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colorButton),
                foregroundColor: WidgetStatePropertyAll(colorText),
              ),
              onPressed: isLoading ? null : () => onPressed(),
              child: isLoading
                  ? CustomLoadingComponent()
                  : Text(
                      text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      textScaler: TextScaler.noScaling,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomOutlinedButtonComponent extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Color? colorButton;
  final Color? colorText;
  final Function onPressed;
  final double? width;
  final double? height;
  const CustomOutlinedButtonComponent({
    super.key,
    required this.text,
    required this.isLoading,
    this.colorButton,
    this.colorText,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return ClipRRect(
      child: Container(
        width: width ?? size.width * .8,
        height: height ?? size.height * .06,
        decoration: BoxDecoration(
          border: Border.all(
            color: colorButton ?? ColorPaletteTheme.primaryColor,
          ),
          borderRadius: BorderRadius.circular(BorderRadiusTheme.borderRadius),
        ),
        child: SizedBox(
          width: width ?? size.width * .8,
          height: height ?? size.height * .06,
          child: OutlinedButton(
            style: ButtonStyle(
              //   backgroundColor: WidgetStatePropertyAll(colorButton),
              foregroundColor: WidgetStatePropertyAll(colorText),
              side: WidgetStatePropertyAll(
                BorderSide(
                  width: .2,
                  color: colorButton ?? ColorPaletteTheme.primaryColor,
                ),
              ),
            ),
            onPressed: isLoading ? null : () => onPressed(),
            child: isLoading
                ? CustomLoadingComponent()
                : Text(
                    text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.noScaling,
                    style: textStyle.headlineSmall!.copyWith(
                      color: colorText ?? ColorPaletteTheme.accentColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class ButtonPlusComponent extends StatelessWidget {
  final Function onTap;
  final Color? colorButton;
  final IconData? icon;
  const ButtonPlusComponent({
    super.key,
    required this.onTap,
    this.colorButton,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(right: size.width * .04),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorPaletteTheme.accentColor.withValues(alpha: .1),
            border: Border.all(color: ColorPaletteTheme.primaryColor),
          ),
          child: Center(
            child: Icon(
              icon ?? FluentIcons.add_12_regular,
              color: colorButton ?? ColorPaletteTheme.primaryColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
