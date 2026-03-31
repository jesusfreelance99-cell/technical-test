import 'package:dio/dio.dart';
import 'package:pokemonapp/core/errors/exceptions.dart';
import 'package:pokemonapp/features/pokemon/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemons(int offset, int limit);
  Future<PokemonModel> getPokemonDetail(String idOrName);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<PokemonModel>> getPokemons(int offset, int limit) async {
    try {
      final response = await dio.get(
        'https://pokeapi.co/api/v2/pokemon',
        queryParameters: {'offset': offset, 'limit': limit},
      );
      final List results = response.data['results'];

      // Concurrently fetch details for all pokemons in the page using Future.wait
      final futures = results.map(
        (result) => getPokemonDetail(result['name'] as String),
      );
      final details = await Future.wait(futures);

      return details;
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Server error');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<PokemonModel> getPokemonDetail(String idOrName) async {
    try {
      final response = await dio.get(
        'https://pokeapi.co/api/v2/pokemon/$idOrName',
      );
      return PokemonModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Server error');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
