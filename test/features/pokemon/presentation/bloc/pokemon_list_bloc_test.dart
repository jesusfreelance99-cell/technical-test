import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemonapp/core/errors/failure.dart';
import 'package:pokemonapp/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemonapp/features/pokemon/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokemonapp/features/pokemon/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokemonapp/features/pokemon/presentation/bloc/pokemon_list_bloc.dart';
import 'package:pokemonapp/features/pokemon/presentation/bloc/pokemon_list_event.dart';
import 'package:pokemonapp/features/pokemon/presentation/bloc/pokemon_list_state.dart';

class MockGetPokemonsUseCase extends Mock implements GetPokemonsUseCase {}

class MockGetPokemonDetailUseCase extends Mock
    implements GetPokemonDetailUseCase {}

void main() {
  late PokemonListBloc bloc;
  late MockGetPokemonsUseCase mockGetPokemons;
  late MockGetPokemonDetailUseCase mockGetPokemonDetail;

  setUp(() {
    mockGetPokemons = MockGetPokemonsUseCase();
    mockGetPokemonDetail = MockGetPokemonDetailUseCase();
    bloc = PokemonListBloc(
      getPokemons: mockGetPokemons,
      searchPokemon: mockGetPokemonDetail,
    );
  });

  tearDown(() {
    bloc.close();
  });

  const tPokemon = PokemonEntity(
    id: 1,
    name: 'bulbasaur',
    imageUrl: 'url',
    types: ['grass'],
    weight: 69,
    height: 7,
    hp: 45,
    attack: 49,
    defense: 49,
    specialAttack: 65,
    specialDefense: 65,
    speed: 45,
  );

  test(
    'should emit [PokemonListLoading, PokemonListLoaded] when data is gotten successfully',
    () async {
      when(
        () => mockGetPokemons(
          offset: any(named: 'offset'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async => const Right([tPokemon]));

      final expected = [
        PokemonListLoading(),
        const PokemonListLoaded(pokemons: [tPokemon], hasReachedMax: false),
      ];

      expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const GetPokemonsEvent());
    },
  );

  test(
    'should emit [PokemonListLoading, PokemonListError] when getting data fails',
    () async {
      when(
        () => mockGetPokemons(
          offset: any(named: 'offset'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async => const Left(ServerFailure('Server Error')));

      final expected = [
        PokemonListLoading(),
        const PokemonListError(message: 'Server Error'),
      ];

      expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const GetPokemonsEvent());
    },
  );
}
