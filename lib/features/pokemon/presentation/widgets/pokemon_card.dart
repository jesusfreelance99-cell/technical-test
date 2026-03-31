import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapp/core/theme/main_theme_export.dart';
import 'package:pokemonapp/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemonapp/features/pokemon/presentation/widgets/gradient_effect_widget.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;
  final VoidCallback onTap;

  const PokemonCard({super.key, required this.pokemon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background Card
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: CardGradientEffectComponent(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      pokemon.name.toUpperCase(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      textScaler: TextScaler.noScaling,
                      style: textStyle.titleMedium?.copyWith(
                        color: ColorPaletteTheme.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Types badges
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 4,
                      runSpacing: 4,
                      children: pokemon.types
                          .map((type) => _buildTypeBadge(type, textStyle))
                          .toList(),
                    ),
                    const SizedBox(height: 10),
                    // Weight and Height short info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${pokemon.weight / 10} kg',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          textScaler: TextScaler.noScaling,
                          style: textStyle.bodySmall?.copyWith(
                            color: ColorPaletteTheme.whiteColor.withValues(alpha: 0.7),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${pokemon.height / 10} m',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          textScaler: TextScaler.noScaling,
                          style: textStyle.bodySmall?.copyWith(
                            color: ColorPaletteTheme.whiteColor.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Pokemon Image overlapping
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: Hero(
              tag: 'pokemon_${pokemon.id}',
              child: CachedNetworkImage(
                imageUrl: pokemon.imageUrl,
                height: 110,
                placeholder: (context, url) => const SizedBox(height: 110),
                errorWidget: (context, url, error) => const Icon(
                  FluentIcons.image_off_24_filled,
                  color: ColorPaletteTheme.greyText,
                  size: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeBadge(String type, TextTheme textStyle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: ColorPaletteTheme.whiteColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(BorderRadiusTheme.borderRadius),
        border: Border.all(color: ColorPaletteTheme.whiteColor.withValues(alpha: 0.3)),
      ),
      child: Text(
        type.toUpperCase(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        textScaler: TextScaler.noScaling,
        style: textStyle.labelSmall?.copyWith(
          color: ColorPaletteTheme.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
