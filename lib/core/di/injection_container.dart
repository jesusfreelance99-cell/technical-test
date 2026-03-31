import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemonapp/features/pokemon/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokemonapp/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemonapp/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemonapp/features/pokemon/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokemonapp/features/pokemon/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokemonapp/features/pokemon/presentation/bloc/pokemon_detail_cubit.dart';
import 'package:pokemonapp/features/pokemon/presentation/bloc/pokemon_list_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(() => PokemonListBloc(getPokemons: sl(), searchPokemon: sl()));
  sl.registerFactory(() => PokemonDetailCubit(getPokemonDetail: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetPokemonsUseCase(sl()));
  sl.registerLazySingleton(() => GetPokemonDetailUseCase(sl()));

  // Repository
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(remoteDataSource: sl()),
  );

  // Data Sources
  sl.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(dio: sl()),
  );

  // Core
  sl.registerLazySingleton(() => Dio());
}
