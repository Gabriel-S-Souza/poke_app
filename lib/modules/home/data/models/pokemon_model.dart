import '../../domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json['id'],
        name: json['name'],
        image: json['imageUrl'],
      );

  factory PokemonModel.fromEntity(PokemonEntity pokemon) => PokemonModel(
        id: pokemon.id,
        name: pokemon.name,
        image: pokemon.image,
      );

  Map<String, dynamic> toJson() => {
        'id': super.id,
        'name': super.name,
        'imageUrl': super.image,
      };
}
