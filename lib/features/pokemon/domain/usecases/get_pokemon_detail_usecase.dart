import 'package:dartz/dartz.dart';
import 'package:pokemonapp/core/errors/failure.dart';
import 'package:pokemonapp/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemonapp/features/pokemon/domain/repositories/pokemon_repository.dart';

class GetPokemonDetailUseCase {
  final PokemonRepository repository;

  GetPokemonDetailUseCase(this.repository);

  Future<Either<Failure, PokemonEntity>> call(String idOrName) async {
    return await repository.getPokemonDetail(idOrName);
  }
}
