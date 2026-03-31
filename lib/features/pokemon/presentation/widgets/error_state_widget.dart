import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapp/core/theme/color_palette_theme.dart';
import 'package:pokemonapp/features/pokemon/presentation/widgets/custom_buttons.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorStateWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            FluentIcons.warning_24_filled,
            size: 64,
            color: ColorPaletteTheme.orangeColor,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            textScaler: TextScaler.noScaling,
            style: textStyle.headlineMedium?.copyWith(
              color: ColorPaletteTheme.orangeColor,
            ),
          ),
          const SizedBox(height: 24),
          CustomPrincipalButton(
            text: 'Volver a intentar',
            isLoading: false,
            colorButton: ColorPaletteTheme.orangeColor,
            colorText: ColorPaletteTheme.whiteColor,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
