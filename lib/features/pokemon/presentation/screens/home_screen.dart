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
      child: Scaffold(
        appBar: AppBar(elevation: 0, title: Text('Pokédex'), centerTitle: true),
        body: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search Pokemon...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  prefixIcon: const Icon(Icons.search, color: Colors.white54),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      BorderRadiusTheme.borderRadius,
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (value) {
                  context.read<PokemonListBloc>().add(
                    SearchPokemonEvent(value),
                  );
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
                              PageRouteBuilder(
                                transitionDuration: const Duration(
                                  milliseconds: 700,
                                ),
                                reverseTransitionDuration: const Duration(
                                  milliseconds: 500,
                                ),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        DetailScreen(pokemon: pokemon),
                                transitionsBuilder:
                                    (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                    ) {
                                      var curve = Curves.easeOutBack;
                                      var tween = Tween(
                                        begin: 0.8,
                                        end: 1.0,
                                      ).chain(CurveTween(curve: curve));
                                      return FadeTransition(
                                        opacity: animation,
                                        child: ScaleTransition(
                                          scale: animation.drive(tween),
                                          child: child,
                                        ),
                                      );
                                    },
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
      baseColor: Colors.white.withValues(alpha: 0.1),
      highlightColor: Colors.white.withValues(alpha: 0.3),
      child: CardGradientEffectComponent(child: Container()),
    );
  }
}
