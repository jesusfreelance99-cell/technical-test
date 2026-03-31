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
      backgroundColor: Colors.black, // Dark theme detail
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            FluentIcons.arrow_left_24_filled,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(FluentIcons.heart_24_filled, color: Colors.white),
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
                    Colors.black,
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
                  style: textStyle.displaySmall?.copyWith(
                    color: Colors.white,
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
                      color: Colors.white.withValues(alpha: 0.05),
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
                            indicatorColor: Colors.white,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.white54,
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
                                    style: textStyle.bodyMedium?.copyWith(
                                      color: Colors.white54,
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
        style: textStyle.labelMedium?.copyWith(
          color: Colors.white,
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
            style: textStyle.bodyLarge?.copyWith(
              color: Colors.white70,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
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
        Icon(icon, color: Colors.white54),
        const SizedBox(height: 8),
        Text(
          value,
          style: textStyle.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: textStyle.bodyMedium?.copyWith(color: Colors.white54),
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
              style: textStyle.bodyMedium?.copyWith(color: Colors.white54),
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              value.toString(),
              style: textStyle.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: value / 150.0,
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation<Color>(
                value > 50 ? Colors.greenAccent : Colors.redAccent,
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
