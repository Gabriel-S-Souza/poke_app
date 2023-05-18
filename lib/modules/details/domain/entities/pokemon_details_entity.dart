import 'poke_statistics_entity.dart';
import 'poke_type.dart';

class PokemonDetailsEntity {
  final int id;
  final String name;
  final String image;
  final double height;
  final double weight;
  final List<PokeType> types;
  final List<String> moves;
  final List<String> abilities;
  final String description;
  final List<PokeStatisticEntity> statistics;

  PokemonDetailsEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.height,
    required this.weight,
    required this.types,
    required this.moves,
    required this.abilities,
    required this.description,
    required this.statistics,
  });
}
