import 'package:equatable/equatable.dart';
import 'package:pokemonapp/features/pokemon/domain/entities/pokemon_entity.dart';

abstract class PokemonListState extends Equatable {
  const PokemonListState();

  @override
  List<Object> get props => [];
}

class PokemonListEmpty extends PokemonListState {}

class PokemonListLoading extends PokemonListState {}

class PokemonListLoaded extends PokemonListState {
  final List<PokemonEntity> pokemons;
  final bool hasReachedMax;

  const PokemonListLoaded({required this.pokemons, this.hasReachedMax = false});

  @override
  List<Object> get props => [pokemons, hasReachedMax];
}

class PokemonListError extends PokemonListState {
  final String message;

  const PokemonListError({required this.message});

  @override
  List<Object> get props => [message];
}
