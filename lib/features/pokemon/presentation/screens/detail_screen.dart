import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapp/core/theme/main_theme_export.dart';
import 'package:pokemonapp/features/pokemon/domain/entities/pokemon_entity.dart';

class DetailScreen extends StatelessWidget {
  final PokemonEntity pokemon;

  const DetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final normalColor = _getTypeColor(
      pokemon.types.isNotEmpty ? pokemon.types.first : 'normal',
    );
    final ioS = Platform.isIOS;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            ioS ? CupertinoIcons.back : FluentIcons.arrow_left_24_filled,
            color: normalColor,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
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
                    ColorPaletteTheme.primaryColor,
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
                    color: normalColor,
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
                      color: normalColor.withValues(alpha: 0.05),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          TabBar(
                            indicatorColor: normalColor,
                            labelColor: normalColor,
                            unselectedLabelColor: ColorPaletteTheme.greyText,
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: normalColor,
                            labelStyle: textStyle.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            tabs: const [
                              Tab(text: 'About'),
                              Tab(text: 'Stats'),
                              Tab(text: 'Evolutions'),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                _buildAboutTab(textStyle),
                                _buildStatsTab(textStyle, normalColor),
                                Center(
                                  child: Text(
                                    'Coming soon...',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    textScaler: TextScaler.noScaling,
                                    style: textStyle.bodyMedium?.copyWith(
                                      color: ColorPaletteTheme.black,
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
                'Peso',
                '${pokemon.weight / 10} kg',
                FluentIcons.scales_24_filled,
                textStyle,
              ),
              _buildInfoColumn(
                'Altura',
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
          style: textStyle.titleLarge?.copyWith(fontWeight: FontWeight.bold),
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

  Widget _buildStatsTab(TextTheme textStyle, Color color) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _buildStatRow('HP', pokemon.hp, textStyle, color),
          _buildStatRow('Attack', pokemon.attack, textStyle, color),
          _buildStatRow('Defense', pokemon.defense, textStyle, color),
          _buildStatRow('Sp. Atk', pokemon.specialAttack, textStyle, color),
          _buildStatRow('Sp. Def', pokemon.specialDefense, textStyle, color),
          _buildStatRow('Speed', pokemon.speed, textStyle, color),
        ],
      ),
    );
  }

  Widget _buildStatRow(
    String name,
    int value,
    TextTheme textStyle,
    Color color,
  ) {
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
              style: textStyle.bodyMedium,
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
                value > 50 ? color : ColorPaletteTheme.greyText,
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
