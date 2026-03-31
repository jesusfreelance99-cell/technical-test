import 'package:dartz/dartz.dart';
import 'package:pokemonapp/core/errors/exceptions.dart';
import 'package:pokemonapp/core/errors/failure.dart';
import 'package:pokemonapp/features/pokemon/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokemonapp/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemonapp/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PokemonEntity>>> getPokemons(int offset, int limit) async {
    try {
      final remotePokemons = await remoteDataSource.getPokemons(offset, limit);
      return Right(remotePokemons);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PokemonEntity>> getPokemonDetail(String idOrName) async {
    try {
      final remotePokemon = await remoteDataSource.getPokemonDetail(idOrName);
      return Right(remotePokemon);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
