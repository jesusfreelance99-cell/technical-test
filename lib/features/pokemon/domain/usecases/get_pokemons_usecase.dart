import 'package:dartz/dartz.dart';
import 'package:pokemonapp/core/errors/failure.dart';
import 'package:pokemonapp/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemonapp/features/pokemon/domain/repositories/pokemon_repository.dart';

class GetPokemonsUseCase {
  final PokemonRepository repository;

  GetPokemonsUseCase(this.repository);

  Future<Either<Failure, List<PokemonEntity>>> call({
    int offset = 0,
    int limit = 20,
  }) async {
    return await repository.getPokemons(offset, limit);
  }
}
