import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int weight;
  final int height;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.weight,
    required this.height,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    imageUrl,
    types,
    weight,
    height,
    hp,
    attack,
    defense,
    specialAttack,
    specialDefense,
    speed,
  ];
}
