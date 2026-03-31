import 'package:dartz/dartz.dart';
import 'package:pokemonapp/core/errors/failure.dart';
import 'package:pokemonapp/features/pokemon/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonEntity>>> getPokemons(int offset, int limit);
  Future<Either<Failure, PokemonEntity>> getPokemonDetail(String idOrName);
}
