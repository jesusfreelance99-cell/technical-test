import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemonapp/core/errors/exceptions.dart';
import 'package:pokemonapp/features/pokemon/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokemonapp/features/pokemon/data/models/pokemon_model.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late PokemonRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = PokemonRemoteDataSourceImpl(dio: mockDio);
  });

  group('getPokemonDetail', () {
    const tPokemonName = 'bulbasaur';
    const tPokemonModel = PokemonModel(
      id: 1,
      name: 'bulbasaur',
      imageUrl: 'url',
      types: ['grass', 'poison'],
      weight: 69,
      height: 7,
      hp: 45,
      attack: 49,
      defense: 49,
      specialAttack: 65,
      specialDefense: 65,
      speed: 45,
    );

    final tJsonResponse = {
      'id': 1,
      'name': 'bulbasaur',
      'sprites': {
        'other': {
          'official-artwork': {'front_default': 'url'},
        },
      },
      'types': [
        {
          'type': {'name': 'grass'},
        },
        {
          'type': {'name': 'poison'},
        },
      ],
      'weight': 69,
      'height': 7,
      'stats': [
        {
          'base_stat': 45,
          'stat': {'name': 'hp'},
        },
        {
          'base_stat': 49,
          'stat': {'name': 'attack'},
        },
        {
          'base_stat': 49,
          'stat': {'name': 'defense'},
        },
        {
          'base_stat': 65,
          'stat': {'name': 'special-attack'},
        },
        {
          'base_stat': 65,
          'stat': {'name': 'special-defense'},
        },
        {
          'base_stat': 45,
          'stat': {'name': 'speed'},
        },
      ],
    };

    test(
      'should return PokemonModel when the response code is 200 (success)',
      () async {
        when(
          () => mockDio.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: tJsonResponse,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        final result = await dataSource.getPokemonDetail(tPokemonName);

        expect(result, equals(tPokemonModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404',
      () async {
        when(
          () => mockDio.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(path: ''),
            ),
          ),
        );

        final call = dataSource.getPokemonDetail;

        expect(() => call(tPokemonName), throwsA(isA<ServerException>()));
      },
    );
  });
}
