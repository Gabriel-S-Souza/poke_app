import 'package:poke_app/modules/home/domain/entities/pokemon_entity.dart';

List<PokemonEntity> getPokemonsMockByPage(int page) {
  final pokemons = <PokemonEntity>[];
  for (var i = 0; i < 50; i++) {
    final pokeId = i + (page * 50) + 1;
    final pokemon = PokemonEntity(
      id: pokeId,
      name: 'Pokemon $pokeId',
      image:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokeId.png',
    );
    pokemons.add(pokemon);
  }
  return pokemons;
}
