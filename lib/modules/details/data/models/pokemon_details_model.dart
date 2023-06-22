import '../../domain/entities/poke_type.dart';
import '../../domain/entities/pokemon_details_entity.dart';
import 'poke_statistics_model.dart';

class PokemonDetailsModel extends PokemonDetailsEntity {
  PokemonDetailsModel({
    required super.id,
    required super.name,
    required super.image,
    required super.height,
    required super.weight,
    required super.types,
    required super.moves,
    required super.abilities,
    required super.description,
    required super.statistics,
  });

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) => PokemonDetailsModel(
        id: json['id'],
        name: json['name'],
        image: json['imageUrl'],
        height: json['height'] / 10,
        weight: json['weight'] / 10,
        types: PokeType.values.where((type) => json['types'].contains(type.toString().split('.').last)).toList(),
        moves: List<String>.from(json['moves']),
        abilities: List<String>.from(json['abilities']),
        description: json['description'],
        statistics: (json['statistics'] as List).map((e) => PokeStatisticModel.fromJson(e)).toList(),
      );
}
