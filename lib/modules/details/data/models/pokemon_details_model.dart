import '../../domain/entities/poke_type.dart';
import '../../domain/entities/pokemon_details_entity.dart';
import 'poke_statistics_model.dart';

class PokemonDetailsModel extends PokemonDetailsEntity {
  PokemonDetailsModel({
    required super.id,
    required super.name,
    required super.image,
    required super.types,
    required super.moves,
    required super.abilities,
    required super.description,
    required super.statistics,
  });

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) => PokemonDetailsModel(
        id: json['id'],
        name: json['name'],
        image: json['sprites']['other']['official-artwork']['front_default'],
        types: _getTypes(json['types']),
        moves: _getMoves(json['moves']),
        abilities: _getAbilities(json['abilities']),
        description:
            'Loren ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        statistics: (json['stats'] as List).map((e) => PokeStatisticModel.fromJson(e)).toList(),
      );
}

List<PokeType> _getTypes(List<dynamic> types) {
  final List<PokeType> pokeTypes = [];
  for (final type in types) {
    pokeTypes.add(
      PokeType.values.firstWhere(
        (e) => e.value == '${type['type']['name']}',
        orElse: () => PokeType.unknown,
      ),
    );
  }
  return pokeTypes;
}

List<String> _getMoves(List<dynamic> moves) {
  final List<String> pokeMoves = [];
  for (final move in moves) {
    pokeMoves.add(move['move']['name']);
  }
  return pokeMoves;
}

List<String> _getAbilities(List<dynamic> abilities) {
  final List<String> pokeAbilities = [];
  for (final ability in abilities) {
    pokeAbilities.add(ability['ability']['name']);
  }
  return pokeAbilities;
}
