import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapp/core/theme/color_palette_theme.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;
  const EmptyStateWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            FluentIcons.folder_open_24_filled,
            size: 64,
            color: ColorPaletteTheme.greyText,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            textScaler: TextScaler.noScaling,
            style: textStyle.titleLarge?.copyWith(
              color: ColorPaletteTheme.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
