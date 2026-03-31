import 'package:pokemonapp/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.types,
    required super.weight,
    required super.height,
    required super.hp,
    required super.attack,
    required super.defense,
    required super.specialAttack,
    required super.specialDefense,
    required super.speed,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    // Types
    final typesList = json['types'] as List?;
    final types =
        typesList?.map((t) => t['type']['name'] as String).toList() ?? [];

    // Stats
    final stats = json['stats'] as List?;
    int getStat(String name) {
      if (stats == null) return 0;
      final filteredList = stats
          .where((s) => s['stat'] != null && s['stat']['name'] == name)
          .toList();
      return filteredList.isNotEmpty
          ? filteredList.first['base_stat'] as int
          : 0;
    }

    final id = json['id'] as int;

    return PokemonModel(
      id: id,
      name: json['name'] ?? '',
      imageUrl:
          json['sprites']?['other']?['official-artwork']?['front_default'] ??
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
      types: types,
      weight: json['weight'] ?? 0,
      height: json['height'] ?? 0,
      hp: getStat('hp'),
      attack: getStat('attack'),
      defense: getStat('defense'),
      specialAttack: getStat('special-attack'),
      specialDefense: getStat('special-defense'),
      speed: getStat('speed'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sprites': {
        'other': {
          'official-artwork': {'front_default': imageUrl},
        },
      },
      'types': types
          .map(
            (t) => {
              'type': {'name': t},
            },
          )
          .toList(),
      'weight': weight,
      'height': height,
      'stats': [
        {
          'base_stat': hp,
          'stat': {'name': 'hp'},
        },
        {
          'base_stat': attack,
          'stat': {'name': 'attack'},
        },
        {
          'base_stat': defense,
          'stat': {'name': 'defense'},
        },
        {
          'base_stat': specialAttack,
          'stat': {'name': 'special-attack'},
        },
        {
          'base_stat': specialDefense,
          'stat': {'name': 'special-defense'},
        },
        {
          'base_stat': speed,
          'stat': {'name': 'speed'},
        },
      ],
    };
  }
}
