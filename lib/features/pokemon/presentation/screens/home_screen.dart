import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemonapp/core/theme/main_theme_export.dart';
import 'package:pokemonapp/features/pokemon/presentation/bloc/pokemon_list_bloc.dart';
import 'package:pokemonapp/features/pokemon/presentation/bloc/pokemon_list_event.dart';
import 'package:pokemonapp/features/pokemon/presentation/bloc/pokemon_list_state.dart';
import 'package:pokemonapp/features/pokemon/presentation/screens/detail_screen.dart';
import 'package:pokemonapp/features/pokemon/presentation/widgets/empty_state_widget.dart';
import 'package:pokemonapp/features/pokemon/presentation/widgets/error_state_widget.dart';
import 'package:pokemonapp/features/pokemon/presentation/widgets/gradient_effect_widget.dart';
import 'package:pokemonapp/features/pokemon/presentation/widgets/pokemon_card.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<PokemonListBloc>().add(const GetPokemonsEvent());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return GradientEffectForScreens(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Poke App',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          textScaler: TextScaler.noScaling,
          style: textStyle.displaySmall!.copyWith(
            color: ColorPaletteTheme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      child: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: ColorPaletteTheme.primaryColor),
              decoration: InputDecoration(
                hintText: 'Search Pokemon...',
                hintStyle: TextStyle(color: ColorPaletteTheme.greyText),
                prefixIcon: const Icon(
                  FluentIcons.search_24_filled,
                  color: ColorPaletteTheme.greyText,
                ),
                filled: true,
                fillColor: ColorPaletteTheme.primaryColor.withValues(
                  alpha: 0.1,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    BorderRadiusTheme.borderRadius,
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (value) {
                context.read<PokemonListBloc>().add(SearchPokemonEvent(value));
              },
            ),
          ),
          // List
          Expanded(
            child: BlocBuilder<PokemonListBloc, PokemonListState>(
              builder: (context, state) {
                if (state is PokemonListLoading) {
                  return _buildShimmerGrid();
                } else if (state is PokemonListError) {
                  return ErrorStateWidget(
                    message: state.message,
                    onRetry: () => context.read<PokemonListBloc>().add(
                      const GetPokemonsEvent(isRefresh: true),
                    ),
                  );
                } else if (state is PokemonListLoaded) {
                  if (state.pokemons.isEmpty) {
                    return const EmptyStateWidget(
                      message: 'No se encontraron Pokémon',
                    );
                  }
                  return GridView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 20,
                        ),
                    itemCount: state.hasReachedMax
                        ? state.pokemons.length
                        : state.pokemons.length + 2,
                    itemBuilder: (context, index) {
                      if (index >= state.pokemons.length) {
                        return _buildShimmerCard();
                      }
                      final pokemon = state.pokemons[index];
                      return PokemonCard(
                        pokemon: pokemon,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(pokemon: pokemon),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => _buildShimmerCard(),
    );
  }

  Widget _buildShimmerCard() {
    return Shimmer.fromColors(
      baseColor: ColorPaletteTheme.primaryColor.withValues(alpha: 0.1),
      highlightColor: ColorPaletteTheme.primaryColor.withValues(alpha: 0.3),
      child: CardGradientEffectComponent(child: Container()),
    );
  }
}
