import 'package:equatable/equatable.dart';

abstract class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonsEvent extends PokemonListEvent {
  final bool isRefresh;
  const GetPokemonsEvent({this.isRefresh = false});

  @override
  List<Object> get props => [isRefresh];
}

class SearchPokemonEvent extends PokemonListEvent {
  final String query;
  const SearchPokemonEvent(this.query);

  @override
  List<Object> get props => [query];
}
