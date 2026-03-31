import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemonapp/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemonapp/features/pokemon/domain/usecases/get_pokemon_detail_usecase.dart';

abstract class PokemonDetailState extends Equatable {
  const PokemonDetailState();
  @override
  List<Object> get props => [];
}

class PokemonDetailInitial extends PokemonDetailState {}
class PokemonDetailLoading extends PokemonDetailState {}
class PokemonDetailLoaded extends PokemonDetailState {
  final PokemonEntity pokemon;
  const PokemonDetailLoaded(this.pokemon);
  @override
  List<Object> get props => [pokemon];
}
class PokemonDetailError extends PokemonDetailState {
  final String message;
  const PokemonDetailError(this.message);
  @override
  List<Object> get props => [message];
}

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  final GetPokemonDetailUseCase getPokemonDetail;

  PokemonDetailCubit({required this.getPokemonDetail}) : super(PokemonDetailInitial());

  Future<void> loadPokemon(String idOrName) async {
    emit(PokemonDetailLoading());
    final failureOrPokemon = await getPokemonDetail(idOrName);
    failureOrPokemon.fold(
      (failure) => emit(PokemonDetailError(failure.message)),
      (pokemon) => emit(PokemonDetailLoaded(pokemon)),
    );
  }
}
