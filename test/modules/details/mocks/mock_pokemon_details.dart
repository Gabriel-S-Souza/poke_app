import 'package:poke_app/modules/details/domain/entities/poke_statistics_entity.dart';
import 'package:poke_app/modules/details/domain/entities/poke_type.dart';
import 'package:poke_app/modules/details/domain/entities/pokemon_details_entity.dart';

final mockPokemonDetails = PokemonDetailsEntity(
  id: 25,
  name: 'Pikachu',
  image:
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
  height: 0.4,
  weight: 6.0,
  types: [PokeType.electric],
  moves: ['Thunderbolt', 'Quick Attack'],
  abilities: ['Static', 'Lightning Rod'],
  description: 'Pikachu is an Electric-type Pokémon.',
  statistics: [
    PokeStatisticEntity(
      name: 'hp',
      value: 35,
    ),
    PokeStatisticEntity(
      name: 'attack',
      value: 55,
    ),
    PokeStatisticEntity(
      name: 'defense',
      value: 40,
    ),
    PokeStatisticEntity(
      name: 'special-attack',
      value: 50,
    ),
    PokeStatisticEntity(
      name: 'special-defense',
      value: 50,
    ),
    PokeStatisticEntity(
      name: 'speed',
      value: 90,
    ),
  ],
);
