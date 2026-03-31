import 'package:cached_network_image/cached_network_image.dart';
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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
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
                  style: textStyle.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pokemon.types
                      .map((t) => _buildTypeBadge(t))
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
                                _buildAboutTab(),
                                _buildStatsTab(),
                                const Center(
                                  child: Text(
                                    'Coming soon...',
                                    style: TextStyle(color: Colors.white54),
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

  Widget _buildTypeBadge(String type) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: _getTypeColor(type),
        borderRadius: BorderRadius.circular(BorderRadiusTheme.borderRadius),
      ),
      child: Text(
        type.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAboutTab() {
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
                Icons.fitness_center,
              ),
              _buildInfoColumn(
                'Height',
                '${pokemon.height / 10} m',
                Icons.height,
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            'A beautiful Pokemon from the Kanto region.', // Placeholder description
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white54),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(color: Colors.white54, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildStatsTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _buildStatRow('HP', pokemon.hp),
          _buildStatRow('Attack', pokemon.attack),
          _buildStatRow('Defense', pokemon.defense),
          _buildStatRow('Sp. Atk', pokemon.specialAttack),
          _buildStatRow('Sp. Def', pokemon.specialDefense),
          _buildStatRow('Speed', pokemon.speed),
        ],
      ),
    );
  }

  Widget _buildStatRow(String name, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              name,
              style: const TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              value.toString(),
              style: const TextStyle(
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
