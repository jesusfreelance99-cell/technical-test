import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemonapp/features/pokemon/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokemonapp/features/pokemon/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokemonapp/features/pokemon/presentation/bloc/pokemon_list_event.dart';
import 'package:pokemonapp/features/pokemon/presentation/bloc/pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final GetPokemonsUseCase getPokemons;
  final GetPokemonDetailUseCase searchPokemon;

  int _offset = 0;
  final int _limit = 20;

  PokemonListBloc({required this.getPokemons, required this.searchPokemon})
    : super(PokemonListEmpty()) {
    on<GetPokemonsEvent>(_onGetPokemons);
    on<SearchPokemonEvent>(_onSearchPokemon);
  }

  Future<void> _onGetPokemons(
    GetPokemonsEvent event,
    Emitter<PokemonListState> emit,
  ) async {
    if (event.isRefresh) {
      _offset = 0;
      emit(PokemonListEmpty());
    }

    final isFirstFetch = state is PokemonListEmpty || event.isRefresh;

    if (isFirstFetch) {
      emit(PokemonListLoading());
    }

    final failureOrPokemons = await getPokemons(offset: _offset, limit: _limit);

    failureOrPokemons.fold(
      (failure) => emit(PokemonListError(message: failure.message)),
      (pokemons) {
        _offset += _limit;
        if (state is PokemonListLoaded && !event.isRefresh) {
          final currentPokemons = (state as PokemonListLoaded).pokemons;
          emit(
            PokemonListLoaded(
              pokemons: currentPokemons + pokemons,
              hasReachedMax: pokemons.isEmpty,
            ),
          );
        } else {
          emit(
            PokemonListLoaded(
              pokemons: pokemons,
              hasReachedMax: pokemons.isEmpty,
            ),
          );
        }
      },
    );
  }

  Future<void> _onSearchPokemon(
    SearchPokemonEvent event,
    Emitter<PokemonListState> emit,
  ) async {
    final query = event.query.trim().toLowerCase();
    if (query.isEmpty) {
      add(const GetPokemonsEvent(isRefresh: true));
      return;
    }
    emit(PokemonListLoading());

    final failureOrPokemon = await searchPokemon(query);
    failureOrPokemon.fold(
      (failure) => emit(const PokemonListError(message: 'Pokemon nout found')),
      (pokemon) {
        emit(PokemonListLoaded(pokemons: [pokemon], hasReachedMax: true));
      },
    );
  }
}
