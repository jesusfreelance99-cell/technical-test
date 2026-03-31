import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapp/core/theme/main_theme_export.dart';
import 'package:pokemonapp/features/pokemon/domain/entities/pokemon_entity.dart';

class DetailScreen extends StatelessWidget {
  final PokemonEntity pokemon;

  const DetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: ColorPaletteTheme.black, // Dark theme detail
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ColorPaletteTheme.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            FluentIcons.arrow_left_24_filled,
            color: ColorPaletteTheme.whiteColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              FluentIcons.heart_24_filled,
              color: ColorPaletteTheme.whiteColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    _getTypeColor(
                      pokemon.types.isNotEmpty ? pokemon.types.first : 'normal',
                    ).withValues(alpha: 0.5),
                    ColorPaletteTheme.black,
                  ],
                  stops: const [0.0, 0.4],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Hero(
                  tag: 'pokemon_${pokemon.id}',
                  child: CachedNetworkImage(
                    imageUrl: pokemon.imageUrl,
                    height: 250,
                  ),
                ),
                Text(
                  pokemon.name.toUpperCase(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.noScaling,
                  style: textStyle.displaySmall?.copyWith(
                    color: ColorPaletteTheme.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pokemon.types
                      .map((t) => _buildTypeBadge(t, textStyle))
                      .toList(),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorPaletteTheme.whiteColor.withValues(
                        alpha: 0.05,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          const TabBar(
                            indicatorColor: ColorPaletteTheme.whiteColor,
                            labelColor: ColorPaletteTheme.whiteColor,
                            unselectedLabelColor: ColorPaletteTheme.greyText,
                            tabs: [
                              Tab(text: 'About'),
                              Tab(text: 'Stats'),
                              Tab(text: 'Evolutions'),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                _buildAboutTab(textStyle),
                                _buildStatsTab(textStyle),
                                Center(
                                  child: Text(
                                    'Coming soon...',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    textScaler: TextScaler.noScaling,
                                    style: textStyle.bodyMedium?.copyWith(
                                      color: ColorPaletteTheme.greyText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeBadge(String type, TextTheme textStyle) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: _getTypeColor(type),
        borderRadius: BorderRadius.circular(BorderRadiusTheme.borderRadius),
      ),
      child: Text(
        type.toUpperCase(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        textScaler: TextScaler.noScaling,
        style: textStyle.labelMedium?.copyWith(
          color: ColorPaletteTheme.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAboutTab(TextTheme textStyle) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoColumn(
                'Weight',
                '${pokemon.weight / 10} kg',
                FluentIcons.scales_24_filled,
                textStyle,
              ),
              _buildInfoColumn(
                'Height',
                '${pokemon.height / 10} m',
                FluentIcons.ruler_24_filled,
                textStyle,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'A beautiful Pokemon from the Kanto region.', // Placeholder description
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            textScaler: TextScaler.noScaling,
            style: textStyle.bodyLarge?.copyWith(
              color: ColorPaletteTheme.whiteColor.withValues(alpha: 0.7),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(
    String title,
    String value,
    IconData icon,
    TextTheme textStyle,
  ) {
    return Column(
      children: [
        Icon(icon, color: ColorPaletteTheme.greyText),
        const SizedBox(height: 8),
        Text(
          value,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          textScaler: TextScaler.noScaling,
          style: textStyle.titleLarge?.copyWith(
            color: ColorPaletteTheme.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          textScaler: TextScaler.noScaling,
          style: textStyle.bodyMedium?.copyWith(
            color: ColorPaletteTheme.greyText,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsTab(TextTheme textStyle) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _buildStatRow('HP', pokemon.hp, textStyle),
          _buildStatRow('Attack', pokemon.attack, textStyle),
          _buildStatRow('Defense', pokemon.defense, textStyle),
          _buildStatRow('Sp. Atk', pokemon.specialAttack, textStyle),
          _buildStatRow('Sp. Def', pokemon.specialDefense, textStyle),
          _buildStatRow('Speed', pokemon.speed, textStyle),
        ],
      ),
    );
  }

  Widget _buildStatRow(String name, int value, TextTheme textStyle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              textScaler: TextScaler.noScaling,
              style: textStyle.bodyMedium?.copyWith(
                color: ColorPaletteTheme.greyText,
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              value.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              textScaler: TextScaler.noScaling,
              style: textStyle.titleMedium?.copyWith(
                color: ColorPaletteTheme.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: value / 150.0,
              backgroundColor: ColorPaletteTheme.whiteColor.withValues(
                alpha: 0.1,
              ),
              valueColor: AlwaysStoppedAnimation<Color>(
                value > 50
                    ? ColorPaletteTheme.successColor
                    : ColorPaletteTheme.errorColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return Colors.orange;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.amber;
      case 'poison':
        return Colors.purple;
      case 'bug':
        return Colors.lightGreen;
      case 'flying':
        return Colors.cyan;
      default:
        return Colors.grey;
    }
  }
}
