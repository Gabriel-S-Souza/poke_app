import 'package:poke_app/modules/home/data/models/pokemon_model.dart';
import 'package:poke_app/modules/home/domain/entities/pokemon_entity.dart';

List<PokemonEntity> getPokemonsMockByPage(int page) {
  final pokemons = <PokemonEntity>[];
  final pokemonsMap = List<Map<String, dynamic>>.from(_first300PokemonsFixture['results'] as List)
      .sublist(page * 50, (page * 50) + 50)
      .toList();

  for (final pokemon in pokemonsMap) {
    pokemons.add(PokemonModel.fromJson(pokemon));
  }
  return pokemons;
}

//

final Map<String, dynamic> _first300PokemonsFixture = {
  'count': 1281,
  'next': 'https://pokeapi.co/api/v2/pokemon?offset=800&limit=481',
  'previous': null,
  'results': <Map<String, dynamic>>[
    {
      'name': 'bulbasaur',
      'url': 'https://pokeapi.co/api/v2/pokemon/1/',
      'id': 1,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
    },
    {
      'name': 'ivysaur',
      'url': 'https://pokeapi.co/api/v2/pokemon/2/',
      'id': 2,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',
    },
    {
      'name': 'venusaur',
      'url': 'https://pokeapi.co/api/v2/pokemon/3/',
      'id': 3,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png',
    },
    {
      'name': 'charmander',
      'url': 'https://pokeapi.co/api/v2/pokemon/4/',
      'id': 4,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
    },
    {
      'name': 'charmeleon',
      'url': 'https://pokeapi.co/api/v2/pokemon/5/',
      'id': 5,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
    },
    {
      'name': 'charizard',
      'url': 'https://pokeapi.co/api/v2/pokemon/6/',
      'id': 6,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
    },
    {
      'name': 'squirtle',
      'url': 'https://pokeapi.co/api/v2/pokemon/7/',
      'id': 7,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
    },
    {
      'name': 'wartortle',
      'url': 'https://pokeapi.co/api/v2/pokemon/8/',
      'id': 8,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png',
    },
    {
      'name': 'blastoise',
      'url': 'https://pokeapi.co/api/v2/pokemon/9/',
      'id': 9,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png',
    },
    {
      'name': 'caterpie',
      'url': 'https://pokeapi.co/api/v2/pokemon/10/',
      'id': 10,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png',
    },
    {
      'name': 'metapod',
      'url': 'https://pokeapi.co/api/v2/pokemon/11/',
      'id': 11,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/11.png',
    },
    {
      'name': 'butterfree',
      'url': 'https://pokeapi.co/api/v2/pokemon/12/',
      'id': 12,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png',
    },
    {
      'name': 'weedle',
      'url': 'https://pokeapi.co/api/v2/pokemon/13/',
      'id': 13,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/13.png',
    },
    {
      'name': 'kakuna',
      'url': 'https://pokeapi.co/api/v2/pokemon/14/',
      'id': 14,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/14.png',
    },
    {
      'name': 'beedrill',
      'url': 'https://pokeapi.co/api/v2/pokemon/15/',
      'id': 15,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/15.png',
    },
    {
      'name': 'pidgey',
      'url': 'https://pokeapi.co/api/v2/pokemon/16/',
      'id': 16,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/16.png',
    },
    {
      'name': 'pidgeotto',
      'url': 'https://pokeapi.co/api/v2/pokemon/17/',
      'id': 17,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/17.png',
    },
    {
      'name': 'pidgeot',
      'url': 'https://pokeapi.co/api/v2/pokemon/18/',
      'id': 18,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/18.png',
    },
    {
      'name': 'rattata',
      'url': 'https://pokeapi.co/api/v2/pokemon/19/',
      'id': 19,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/19.png',
    },
    {
      'name': 'raticate',
      'url': 'https://pokeapi.co/api/v2/pokemon/20/',
      'id': 20,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/20.png',
    },
    {
      'name': 'spearow',
      'url': 'https://pokeapi.co/api/v2/pokemon/21/',
      'id': 21,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/21.png',
    },
    {
      'name': 'fearow',
      'url': 'https://pokeapi.co/api/v2/pokemon/22/',
      'id': 22,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/22.png',
    },
    {
      'name': 'ekans',
      'url': 'https://pokeapi.co/api/v2/pokemon/23/',
      'id': 23,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/23.png',
    },
    {
      'name': 'arbok',
      'url': 'https://pokeapi.co/api/v2/pokemon/24/',
      'id': 24,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/24.png',
    },
    {
      'name': 'pikachu',
      'url': 'https://pokeapi.co/api/v2/pokemon/25/',
      'id': 25,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
    },
    {
      'name': 'raichu',
      'url': 'https://pokeapi.co/api/v2/pokemon/26/',
      'id': 26,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/26.png',
    },
    {
      'name': 'sandshrew',
      'url': 'https://pokeapi.co/api/v2/pokemon/27/',
      'id': 27,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/27.png',
    },
    {
      'name': 'sandslash',
      'url': 'https://pokeapi.co/api/v2/pokemon/28/',
      'id': 28,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/28.png',
    },
    {
      'name': 'nidoran-f',
      'url': 'https://pokeapi.co/api/v2/pokemon/29/',
      'id': 29,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/29.png',
    },
    {
      'name': 'nidorina',
      'url': 'https://pokeapi.co/api/v2/pokemon/30/',
      'id': 30,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/30.png',
    },
    {
      'name': 'nidoqueen',
      'url': 'https://pokeapi.co/api/v2/pokemon/31/',
      'id': 31,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/31.png',
    },
    {
      'name': 'nidoran-m',
      'url': 'https://pokeapi.co/api/v2/pokemon/32/',
      'id': 32,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/32.png',
    },
    {
      'name': 'nidorino',
      'url': 'https://pokeapi.co/api/v2/pokemon/33/',
      'id': 33,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/33.png',
    },
    {
      'name': 'nidoking',
      'url': 'https://pokeapi.co/api/v2/pokemon/34/',
      'id': 34,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/34.png',
    },
    {
      'name': 'clefairy',
      'url': 'https://pokeapi.co/api/v2/pokemon/35/',
      'id': 35,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/35.png',
    },
    {
      'name': 'clefable',
      'url': 'https://pokeapi.co/api/v2/pokemon/36/',
      'id': 36,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/36.png',
    },
    {
      'name': 'vulpix',
      'url': 'https://pokeapi.co/api/v2/pokemon/37/',
      'id': 37,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/37.png',
    },
    {
      'name': 'ninetales',
      'url': 'https://pokeapi.co/api/v2/pokemon/38/',
      'id': 38,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/38.png',
    },
    {
      'name': 'jigglypuff',
      'url': 'https://pokeapi.co/api/v2/pokemon/39/',
      'id': 39,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/39.png',
    },
    {
      'name': 'wigglytuff',
      'url': 'https://pokeapi.co/api/v2/pokemon/40/',
      'id': 40,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/40.png',
    },
    {
      'name': 'zubat',
      'url': 'https://pokeapi.co/api/v2/pokemon/41/',
      'id': 41,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/41.png',
    },
    {
      'name': 'golbat',
      'url': 'https://pokeapi.co/api/v2/pokemon/42/',
      'id': 42,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/42.png',
    },
    {
      'name': 'oddish',
      'url': 'https://pokeapi.co/api/v2/pokemon/43/',
      'id': 43,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/43.png',
    },
    {
      'name': 'gloom',
      'url': 'https://pokeapi.co/api/v2/pokemon/44/',
      'id': 44,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/44.png',
    },
    {
      'name': 'vileplume',
      'url': 'https://pokeapi.co/api/v2/pokemon/45/',
      'id': 45,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/45.png',
    },
    {
      'name': 'paras',
      'url': 'https://pokeapi.co/api/v2/pokemon/46/',
      'id': 46,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/46.png',
    },
    {
      'name': 'parasect',
      'url': 'https://pokeapi.co/api/v2/pokemon/47/',
      'id': 47,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/47.png',
    },
    {
      'name': 'venonat',
      'url': 'https://pokeapi.co/api/v2/pokemon/48/',
      'id': 48,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/48.png',
    },
    {
      'name': 'venomoth',
      'url': 'https://pokeapi.co/api/v2/pokemon/49/',
      'id': 49,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/49.png',
    },
    {
      'name': 'diglett',
      'url': 'https://pokeapi.co/api/v2/pokemon/50/',
      'id': 50,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/50.png',
    },
    {
      'name': 'dugtrio',
      'url': 'https://pokeapi.co/api/v2/pokemon/51/',
      'id': 51,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/51.png',
    },
    {
      'name': 'meowth',
      'url': 'https://pokeapi.co/api/v2/pokemon/52/',
      'id': 52,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/52.png',
    },
    {
      'name': 'persian',
      'url': 'https://pokeapi.co/api/v2/pokemon/53/',
      'id': 53,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/53.png',
    },
    {
      'name': 'psyduck',
      'url': 'https://pokeapi.co/api/v2/pokemon/54/',
      'id': 54,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/54.png',
    },
    {
      'name': 'golduck',
      'url': 'https://pokeapi.co/api/v2/pokemon/55/',
      'id': 55,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/55.png',
    },
    {
      'name': 'mankey',
      'url': 'https://pokeapi.co/api/v2/pokemon/56/',
      'id': 56,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/56.png',
    },
    {
      'name': 'primeape',
      'url': 'https://pokeapi.co/api/v2/pokemon/57/',
      'id': 57,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/57.png',
    },
    {
      'name': 'growlithe',
      'url': 'https://pokeapi.co/api/v2/pokemon/58/',
      'id': 58,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/58.png',
    },
    {
      'name': 'arcanine',
      'url': 'https://pokeapi.co/api/v2/pokemon/59/',
      'id': 59,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/59.png',
    },
    {
      'name': 'poliwag',
      'url': 'https://pokeapi.co/api/v2/pokemon/60/',
      'id': 60,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/60.png',
    },
    {
      'name': 'poliwhirl',
      'url': 'https://pokeapi.co/api/v2/pokemon/61/',
      'id': 61,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/61.png',
    },
    {
      'name': 'poliwrath',
      'url': 'https://pokeapi.co/api/v2/pokemon/62/',
      'id': 62,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/62.png',
    },
    {
      'name': 'abra',
      'url': 'https://pokeapi.co/api/v2/pokemon/63/',
      'id': 63,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/63.png',
    },
    {
      'name': 'kadabra',
      'url': 'https://pokeapi.co/api/v2/pokemon/64/',
      'id': 64,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/64.png',
    },
    {
      'name': 'alakazam',
      'url': 'https://pokeapi.co/api/v2/pokemon/65/',
      'id': 65,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/65.png',
    },
    {
      'name': 'machop',
      'url': 'https://pokeapi.co/api/v2/pokemon/66/',
      'id': 66,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/66.png',
    },
    {
      'name': 'machoke',
      'url': 'https://pokeapi.co/api/v2/pokemon/67/',
      'id': 67,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/67.png',
    },
    {
      'name': 'machamp',
      'url': 'https://pokeapi.co/api/v2/pokemon/68/',
      'id': 68,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/68.png',
    },
    {
      'name': 'bellsprout',
      'url': 'https://pokeapi.co/api/v2/pokemon/69/',
      'id': 69,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/69.png',
    },
    {
      'name': 'weepinbell',
      'url': 'https://pokeapi.co/api/v2/pokemon/70/',
      'id': 70,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/70.png',
    },
    {
      'name': 'victreebel',
      'url': 'https://pokeapi.co/api/v2/pokemon/71/',
      'id': 71,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/71.png',
    },
    {
      'name': 'tentacool',
      'url': 'https://pokeapi.co/api/v2/pokemon/72/',
      'id': 72,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/72.png',
    },
    {
      'name': 'tentacruel',
      'url': 'https://pokeapi.co/api/v2/pokemon/73/',
      'id': 73,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/73.png',
    },
    {
      'name': 'geodude',
      'url': 'https://pokeapi.co/api/v2/pokemon/74/',
      'id': 74,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/74.png',
    },
    {
      'name': 'graveler',
      'url': 'https://pokeapi.co/api/v2/pokemon/75/',
      'id': 75,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/75.png',
    },
    {
      'name': 'golem',
      'url': 'https://pokeapi.co/api/v2/pokemon/76/',
      'id': 76,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/76.png',
    },
    {
      'name': 'ponyta',
      'url': 'https://pokeapi.co/api/v2/pokemon/77/',
      'id': 77,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/77.png',
    },
    {
      'name': 'rapidash',
      'url': 'https://pokeapi.co/api/v2/pokemon/78/',
      'id': 78,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/78.png',
    },
    {
      'name': 'slowpoke',
      'url': 'https://pokeapi.co/api/v2/pokemon/79/',
      'id': 79,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/79.png',
    },
    {
      'name': 'slowbro',
      'url': 'https://pokeapi.co/api/v2/pokemon/80/',
      'id': 80,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/80.png',
    },
    {
      'name': 'magnemite',
      'url': 'https://pokeapi.co/api/v2/pokemon/81/',
      'id': 81,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/81.png',
    },
    {
      'name': 'magneton',
      'url': 'https://pokeapi.co/api/v2/pokemon/82/',
      'id': 82,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/82.png',
    },
    {
      'name': 'farfetchd',
      'url': 'https://pokeapi.co/api/v2/pokemon/83/',
      'id': 83,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/83.png',
    },
    {
      'name': 'doduo',
      'url': 'https://pokeapi.co/api/v2/pokemon/84/',
      'id': 84,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/84.png',
    },
    {
      'name': 'dodrio',
      'url': 'https://pokeapi.co/api/v2/pokemon/85/',
      'id': 85,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/85.png',
    },
    {
      'name': 'seel',
      'url': 'https://pokeapi.co/api/v2/pokemon/86/',
      'id': 86,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/86.png',
    },
    {
      'name': 'dewgong',
      'url': 'https://pokeapi.co/api/v2/pokemon/87/',
      'id': 87,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/87.png',
    },
    {
      'name': 'grimer',
      'url': 'https://pokeapi.co/api/v2/pokemon/88/',
      'id': 88,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/88.png',
    },
    {
      'name': 'muk',
      'url': 'https://pokeapi.co/api/v2/pokemon/89/',
      'id': 89,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/89.png',
    },
    {
      'name': 'shellder',
      'url': 'https://pokeapi.co/api/v2/pokemon/90/',
      'id': 90,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/90.png',
    },
    {
      'name': 'cloyster',
      'url': 'https://pokeapi.co/api/v2/pokemon/91/',
      'id': 91,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/91.png',
    },
    {
      'name': 'gastly',
      'url': 'https://pokeapi.co/api/v2/pokemon/92/',
      'id': 92,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/92.png',
    },
    {
      'name': 'haunter',
      'url': 'https://pokeapi.co/api/v2/pokemon/93/',
      'id': 93,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/93.png',
    },
    {
      'name': 'gengar',
      'url': 'https://pokeapi.co/api/v2/pokemon/94/',
      'id': 94,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/94.png',
    },
    {
      'name': 'onix',
      'url': 'https://pokeapi.co/api/v2/pokemon/95/',
      'id': 95,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/95.png',
    },
    {
      'name': 'drowzee',
      'url': 'https://pokeapi.co/api/v2/pokemon/96/',
      'id': 96,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/96.png',
    },
    {
      'name': 'hypno',
      'url': 'https://pokeapi.co/api/v2/pokemon/97/',
      'id': 97,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/97.png',
    },
    {
      'name': 'krabby',
      'url': 'https://pokeapi.co/api/v2/pokemon/98/',
      'id': 98,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/98.png',
    },
    {
      'name': 'kingler',
      'url': 'https://pokeapi.co/api/v2/pokemon/99/',
      'id': 99,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/99.png',
    },
    {
      'name': 'voltorb',
      'url': 'https://pokeapi.co/api/v2/pokemon/100/',
      'id': 100,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/100.png',
    },
    {
      'name': 'electrode',
      'url': 'https://pokeapi.co/api/v2/pokemon/101/',
      'id': 101,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/101.png',
    },
    {
      'name': 'exeggcute',
      'url': 'https://pokeapi.co/api/v2/pokemon/102/',
      'id': 102,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/102.png',
    },
    {
      'name': 'exeggutor',
      'url': 'https://pokeapi.co/api/v2/pokemon/103/',
      'id': 103,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/103.png',
    },
    {
      'name': 'cubone',
      'url': 'https://pokeapi.co/api/v2/pokemon/104/',
      'id': 104,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/104.png',
    },
    {
      'name': 'marowak',
      'url': 'https://pokeapi.co/api/v2/pokemon/105/',
      'id': 105,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/105.png',
    },
    {
      'name': 'hitmonlee',
      'url': 'https://pokeapi.co/api/v2/pokemon/106/',
      'id': 106,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/106.png',
    },
    {
      'name': 'hitmonchan',
      'url': 'https://pokeapi.co/api/v2/pokemon/107/',
      'id': 107,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/107.png',
    },
    {
      'name': 'lickitung',
      'url': 'https://pokeapi.co/api/v2/pokemon/108/',
      'id': 108,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/108.png',
    },
    {
      'name': 'koffing',
      'url': 'https://pokeapi.co/api/v2/pokemon/109/',
      'id': 109,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/109.png',
    },
    {
      'name': 'weezing',
      'url': 'https://pokeapi.co/api/v2/pokemon/110/',
      'id': 110,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/110.png',
    },
    {
      'name': 'rhyhorn',
      'url': 'https://pokeapi.co/api/v2/pokemon/111/',
      'id': 111,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/111.png',
    },
    {
      'name': 'rhydon',
      'url': 'https://pokeapi.co/api/v2/pokemon/112/',
      'id': 112,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/112.png',
    },
    {
      'name': 'chansey',
      'url': 'https://pokeapi.co/api/v2/pokemon/113/',
      'id': 113,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/113.png',
    },
    {
      'name': 'tangela',
      'url': 'https://pokeapi.co/api/v2/pokemon/114/',
      'id': 114,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/114.png',
    },
    {
      'name': 'kangaskhan',
      'url': 'https://pokeapi.co/api/v2/pokemon/115/',
      'id': 115,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/115.png',
    },
    {
      'name': 'horsea',
      'url': 'https://pokeapi.co/api/v2/pokemon/116/',
      'id': 116,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/116.png',
    },
    {
      'name': 'seadra',
      'url': 'https://pokeapi.co/api/v2/pokemon/117/',
      'id': 117,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/117.png',
    },
    {
      'name': 'goldeen',
      'url': 'https://pokeapi.co/api/v2/pokemon/118/',
      'id': 118,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/118.png',
    },
    {
      'name': 'seaking',
      'url': 'https://pokeapi.co/api/v2/pokemon/119/',
      'id': 119,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/119.png',
    },
    {
      'name': 'staryu',
      'url': 'https://pokeapi.co/api/v2/pokemon/120/',
      'id': 120,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/120.png',
    },
    {
      'name': 'starmie',
      'url': 'https://pokeapi.co/api/v2/pokemon/121/',
      'id': 121,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/121.png',
    },
    {
      'name': 'mr-mime',
      'url': 'https://pokeapi.co/api/v2/pokemon/122/',
      'id': 122,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/122.png',
    },
    {
      'name': 'scyther',
      'url': 'https://pokeapi.co/api/v2/pokemon/123/',
      'id': 123,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/123.png',
    },
    {
      'name': 'jynx',
      'url': 'https://pokeapi.co/api/v2/pokemon/124/',
      'id': 124,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/124.png',
    },
    {
      'name': 'electabuzz',
      'url': 'https://pokeapi.co/api/v2/pokemon/125/',
      'id': 125,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/125.png',
    },
    {
      'name': 'magmar',
      'url': 'https://pokeapi.co/api/v2/pokemon/126/',
      'id': 126,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/126.png',
    },
    {
      'name': 'pinsir',
      'url': 'https://pokeapi.co/api/v2/pokemon/127/',
      'id': 127,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/127.png',
    },
    {
      'name': 'tauros',
      'url': 'https://pokeapi.co/api/v2/pokemon/128/',
      'id': 128,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/128.png',
    },
    {
      'name': 'magikarp',
      'url': 'https://pokeapi.co/api/v2/pokemon/129/',
      'id': 129,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/129.png',
    },
    {
      'name': 'gyarados',
      'url': 'https://pokeapi.co/api/v2/pokemon/130/',
      'id': 130,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/130.png',
    },
    {
      'name': 'lapras',
      'url': 'https://pokeapi.co/api/v2/pokemon/131/',
      'id': 131,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/131.png',
    },
    {
      'name': 'ditto',
      'url': 'https://pokeapi.co/api/v2/pokemon/132/',
      'id': 132,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/132.png',
    },
    {
      'name': 'eevee',
      'url': 'https://pokeapi.co/api/v2/pokemon/133/',
      'id': 133,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/133.png',
    },
    {
      'name': 'vaporeon',
      'url': 'https://pokeapi.co/api/v2/pokemon/134/',
      'id': 134,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/134.png',
    },
    {
      'name': 'jolteon',
      'url': 'https://pokeapi.co/api/v2/pokemon/135/',
      'id': 135,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/135.png',
    },
    {
      'name': 'flareon',
      'url': 'https://pokeapi.co/api/v2/pokemon/136/',
      'id': 136,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/136.png',
    },
    {
      'name': 'porygon',
      'url': 'https://pokeapi.co/api/v2/pokemon/137/',
      'id': 137,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/137.png',
    },
    {
      'name': 'omanyte',
      'url': 'https://pokeapi.co/api/v2/pokemon/138/',
      'id': 138,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/138.png',
    },
    {
      'name': 'omastar',
      'url': 'https://pokeapi.co/api/v2/pokemon/139/',
      'id': 139,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/139.png',
    },
    {
      'name': 'kabuto',
      'url': 'https://pokeapi.co/api/v2/pokemon/140/',
      'id': 140,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/140.png',
    },
    {
      'name': 'kabutops',
      'url': 'https://pokeapi.co/api/v2/pokemon/141/',
      'id': 141,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/141.png',
    },
    {
      'name': 'aerodactyl',
      'url': 'https://pokeapi.co/api/v2/pokemon/142/',
      'id': 142,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/142.png',
    },
    {
      'name': 'snorlax',
      'url': 'https://pokeapi.co/api/v2/pokemon/143/',
      'id': 143,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/143.png',
    },
    {
      'name': 'articuno',
      'url': 'https://pokeapi.co/api/v2/pokemon/144/',
      'id': 144,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/144.png',
    },
    {
      'name': 'zapdos',
      'url': 'https://pokeapi.co/api/v2/pokemon/145/',
      'id': 145,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/145.png',
    },
    {
      'name': 'moltres',
      'url': 'https://pokeapi.co/api/v2/pokemon/146/',
      'id': 146,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/146.png',
    },
    {
      'name': 'dratini',
      'url': 'https://pokeapi.co/api/v2/pokemon/147/',
      'id': 147,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/147.png',
    },
    {
      'name': 'dragonair',
      'url': 'https://pokeapi.co/api/v2/pokemon/148/',
      'id': 148,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/148.png',
    },
    {
      'name': 'dragonite',
      'url': 'https://pokeapi.co/api/v2/pokemon/149/',
      'id': 149,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/149.png',
    },
    {
      'name': 'mewtwo',
      'url': 'https://pokeapi.co/api/v2/pokemon/150/',
      'id': 150,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png',
    },
    {
      'name': 'mew',
      'url': 'https://pokeapi.co/api/v2/pokemon/151/',
      'id': 151,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/151.png',
    },
    {
      'name': 'chikorita',
      'url': 'https://pokeapi.co/api/v2/pokemon/152/',
      'id': 152,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/152.png',
    },
    {
      'name': 'bayleef',
      'url': 'https://pokeapi.co/api/v2/pokemon/153/',
      'id': 153,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/153.png',
    },
    {
      'name': 'meganium',
      'url': 'https://pokeapi.co/api/v2/pokemon/154/',
      'id': 154,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/154.png',
    },
    {
      'name': 'cyndaquil',
      'url': 'https://pokeapi.co/api/v2/pokemon/155/',
      'id': 155,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/155.png',
    },
    {
      'name': 'quilava',
      'url': 'https://pokeapi.co/api/v2/pokemon/156/',
      'id': 156,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/156.png',
    },
    {
      'name': 'typhlosion',
      'url': 'https://pokeapi.co/api/v2/pokemon/157/',
      'id': 157,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/157.png',
    },
    {
      'name': 'totodile',
      'url': 'https://pokeapi.co/api/v2/pokemon/158/',
      'id': 158,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/158.png',
    },
    {
      'name': 'croconaw',
      'url': 'https://pokeapi.co/api/v2/pokemon/159/',
      'id': 159,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/159.png',
    },
    {
      'name': 'feraligatr',
      'url': 'https://pokeapi.co/api/v2/pokemon/160/',
      'id': 160,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/160.png',
    },
    {
      'name': 'sentret',
      'url': 'https://pokeapi.co/api/v2/pokemon/161/',
      'id': 161,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/161.png',
    },
    {
      'name': 'furret',
      'url': 'https://pokeapi.co/api/v2/pokemon/162/',
      'id': 162,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/162.png',
    },
    {
      'name': 'hoothoot',
      'url': 'https://pokeapi.co/api/v2/pokemon/163/',
      'id': 163,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/163.png',
    },
    {
      'name': 'noctowl',
      'url': 'https://pokeapi.co/api/v2/pokemon/164/',
      'id': 164,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/164.png',
    },
    {
      'name': 'ledyba',
      'url': 'https://pokeapi.co/api/v2/pokemon/165/',
      'id': 165,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/165.png',
    },
    {
      'name': 'ledian',
      'url': 'https://pokeapi.co/api/v2/pokemon/166/',
      'id': 166,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/166.png',
    },
    {
      'name': 'spinarak',
      'url': 'https://pokeapi.co/api/v2/pokemon/167/',
      'id': 167,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/167.png',
    },
    {
      'name': 'ariados',
      'url': 'https://pokeapi.co/api/v2/pokemon/168/',
      'id': 168,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/168.png',
    },
    {
      'name': 'crobat',
      'url': 'https://pokeapi.co/api/v2/pokemon/169/',
      'id': 169,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/169.png',
    },
    {
      'name': 'chinchou',
      'url': 'https://pokeapi.co/api/v2/pokemon/170/',
      'id': 170,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/170.png',
    },
    {
      'name': 'lanturn',
      'url': 'https://pokeapi.co/api/v2/pokemon/171/',
      'id': 171,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/171.png',
    },
    {
      'name': 'pichu',
      'url': 'https://pokeapi.co/api/v2/pokemon/172/',
      'id': 172,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/172.png',
    },
    {
      'name': 'cleffa',
      'url': 'https://pokeapi.co/api/v2/pokemon/173/',
      'id': 173,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/173.png',
    },
    {
      'name': 'igglybuff',
      'url': 'https://pokeapi.co/api/v2/pokemon/174/',
      'id': 174,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/174.png',
    },
    {
      'name': 'togepi',
      'url': 'https://pokeapi.co/api/v2/pokemon/175/',
      'id': 175,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/175.png',
    },
    {
      'name': 'togetic',
      'url': 'https://pokeapi.co/api/v2/pokemon/176/',
      'id': 176,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/176.png',
    },
    {
      'name': 'natu',
      'url': 'https://pokeapi.co/api/v2/pokemon/177/',
      'id': 177,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/177.png',
    },
    {
      'name': 'xatu',
      'url': 'https://pokeapi.co/api/v2/pokemon/178/',
      'id': 178,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/178.png',
    },
    {
      'name': 'mareep',
      'url': 'https://pokeapi.co/api/v2/pokemon/179/',
      'id': 179,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/179.png',
    },
    {
      'name': 'flaaffy',
      'url': 'https://pokeapi.co/api/v2/pokemon/180/',
      'id': 180,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/180.png',
    },
    {
      'name': 'ampharos',
      'url': 'https://pokeapi.co/api/v2/pokemon/181/',
      'id': 181,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/181.png',
    },
    {
      'name': 'bellossom',
      'url': 'https://pokeapi.co/api/v2/pokemon/182/',
      'id': 182,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/182.png',
    },
    {
      'name': 'marill',
      'url': 'https://pokeapi.co/api/v2/pokemon/183/',
      'id': 183,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/183.png',
    },
    {
      'name': 'azumarill',
      'url': 'https://pokeapi.co/api/v2/pokemon/184/',
      'id': 184,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/184.png',
    },
    {
      'name': 'sudowoodo',
      'url': 'https://pokeapi.co/api/v2/pokemon/185/',
      'id': 185,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/185.png',
    },
    {
      'name': 'politoed',
      'url': 'https://pokeapi.co/api/v2/pokemon/186/',
      'id': 186,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/186.png',
    },
    {
      'name': 'hoppip',
      'url': 'https://pokeapi.co/api/v2/pokemon/187/',
      'id': 187,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/187.png',
    },
    {
      'name': 'skiploom',
      'url': 'https://pokeapi.co/api/v2/pokemon/188/',
      'id': 188,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/188.png',
    },
    {
      'name': 'jumpluff',
      'url': 'https://pokeapi.co/api/v2/pokemon/189/',
      'id': 189,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/189.png',
    },
    {
      'name': 'aipom',
      'url': 'https://pokeapi.co/api/v2/pokemon/190/',
      'id': 190,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/190.png',
    },
    {
      'name': 'sunkern',
      'url': 'https://pokeapi.co/api/v2/pokemon/191/',
      'id': 191,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/191.png',
    },
    {
      'name': 'sunflora',
      'url': 'https://pokeapi.co/api/v2/pokemon/192/',
      'id': 192,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/192.png',
    },
    {
      'name': 'yanma',
      'url': 'https://pokeapi.co/api/v2/pokemon/193/',
      'id': 193,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/193.png',
    },
    {
      'name': 'wooper',
      'url': 'https://pokeapi.co/api/v2/pokemon/194/',
      'id': 194,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/194.png',
    },
    {
      'name': 'quagsire',
      'url': 'https://pokeapi.co/api/v2/pokemon/195/',
      'id': 195,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/195.png',
    },
    {
      'name': 'espeon',
      'url': 'https://pokeapi.co/api/v2/pokemon/196/',
      'id': 196,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/196.png',
    },
    {
      'name': 'umbreon',
      'url': 'https://pokeapi.co/api/v2/pokemon/197/',
      'id': 197,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/197.png',
    },
    {
      'name': 'murkrow',
      'url': 'https://pokeapi.co/api/v2/pokemon/198/',
      'id': 198,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/198.png',
    },
    {
      'name': 'slowking',
      'url': 'https://pokeapi.co/api/v2/pokemon/199/',
      'id': 199,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/199.png',
    },
    {
      'name': 'misdreavus',
      'url': 'https://pokeapi.co/api/v2/pokemon/200/',
      'id': 200,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/200.png',
    },
    {
      'name': 'electrode',
      'url': 'https://pokeapi.co/api/v2/pokemon/101/',
      'id': 101,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/101.png',
    },
    {
      'name': 'exeggcute',
      'url': 'https://pokeapi.co/api/v2/pokemon/102/',
      'id': 102,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/102.png',
    },
    {
      'name': 'exeggutor',
      'url': 'https://pokeapi.co/api/v2/pokemon/103/',
      'id': 103,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/103.png',
    },
    {
      'name': 'cubone',
      'url': 'https://pokeapi.co/api/v2/pokemon/104/',
      'id': 104,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/104.png',
    },
    {
      'name': 'marowak',
      'url': 'https://pokeapi.co/api/v2/pokemon/105/',
      'id': 105,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/105.png',
    },
    {
      'name': 'hitmonlee',
      'url': 'https://pokeapi.co/api/v2/pokemon/106/',
      'id': 106,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/106.png',
    },
    {
      'name': 'hitmonchan',
      'url': 'https://pokeapi.co/api/v2/pokemon/107/',
      'id': 107,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/107.png',
    },
    {
      'name': 'lickitung',
      'url': 'https://pokeapi.co/api/v2/pokemon/108/',
      'id': 108,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/108.png',
    },
    {
      'name': 'koffing',
      'url': 'https://pokeapi.co/api/v2/pokemon/109/',
      'id': 109,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/109.png',
    },
    {
      'name': 'weezing',
      'url': 'https://pokeapi.co/api/v2/pokemon/110/',
      'id': 110,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/110.png',
    },
    {
      'name': 'rhyhorn',
      'url': 'https://pokeapi.co/api/v2/pokemon/111/',
      'id': 111,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/111.png',
    },
    {
      'name': 'rhydon',
      'url': 'https://pokeapi.co/api/v2/pokemon/112/',
      'id': 112,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/112.png',
    },
    {
      'name': 'chansey',
      'url': 'https://pokeapi.co/api/v2/pokemon/113/',
      'id': 113,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/113.png',
    },
    {
      'name': 'tangela',
      'url': 'https://pokeapi.co/api/v2/pokemon/114/',
      'id': 114,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/114.png',
    },
    {
      'name': 'kangaskhan',
      'url': 'https://pokeapi.co/api/v2/pokemon/115/',
      'id': 115,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/115.png',
    },
    {
      'name': 'horsea',
      'url': 'https://pokeapi.co/api/v2/pokemon/116/',
      'id': 116,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/116.png',
    },
    {
      'name': 'seadra',
      'url': 'https://pokeapi.co/api/v2/pokemon/117/',
      'id': 117,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/117.png',
    },
    {
      'name': 'goldeen',
      'url': 'https://pokeapi.co/api/v2/pokemon/118/',
      'id': 118,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/118.png',
    },
    {
      'name': 'seaking',
      'url': 'https://pokeapi.co/api/v2/pokemon/119/',
      'id': 119,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/119.png',
    },
    {
      'name': 'staryu',
      'url': 'https://pokeapi.co/api/v2/pokemon/120/',
      'id': 120,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/120.png',
    },
    {
      'name': 'starmie',
      'url': 'https://pokeapi.co/api/v2/pokemon/121/',
      'id': 121,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/121.png',
    },
    {
      'name': 'mr-mime',
      'url': 'https://pokeapi.co/api/v2/pokemon/122/',
      'id': 122,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/122.png',
    },
    {
      'name': 'scyther',
      'url': 'https://pokeapi.co/api/v2/pokemon/123/',
      'id': 123,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/123.png',
    },
    {
      'name': 'jynx',
      'url': 'https://pokeapi.co/api/v2/pokemon/124/',
      'id': 124,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/124.png',
    },
    {
      'name': 'electabuzz',
      'url': 'https://pokeapi.co/api/v2/pokemon/125/',
      'id': 125,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/125.png',
    },
    {
      'name': 'magmar',
      'url': 'https://pokeapi.co/api/v2/pokemon/126/',
      'id': 126,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/126.png',
    },
    {
      'name': 'pinsir',
      'url': 'https://pokeapi.co/api/v2/pokemon/127/',
      'id': 127,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/127.png',
    },
    {
      'name': 'tauros',
      'url': 'https://pokeapi.co/api/v2/pokemon/128/',
      'id': 128,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/128.png',
    },
    {
      'name': 'magikarp',
      'url': 'https://pokeapi.co/api/v2/pokemon/129/',
      'id': 129,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/129.png',
    },
    {
      'name': 'gyarados',
      'url': 'https://pokeapi.co/api/v2/pokemon/130/',
      'id': 130,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/130.png',
    },
    {
      'name': 'lapras',
      'url': 'https://pokeapi.co/api/v2/pokemon/131/',
      'id': 131,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/131.png',
    },
    {
      'name': 'ditto',
      'url': 'https://pokeapi.co/api/v2/pokemon/132/',
      'id': 132,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/132.png',
    },
    {
      'name': 'eevee',
      'url': 'https://pokeapi.co/api/v2/pokemon/133/',
      'id': 133,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/133.png',
    },
    {
      'name': 'vaporeon',
      'url': 'https://pokeapi.co/api/v2/pokemon/134/',
      'id': 134,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/134.png',
    },
    {
      'name': 'jolteon',
      'url': 'https://pokeapi.co/api/v2/pokemon/135/',
      'id': 135,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/135.png',
    },
    {
      'name': 'flareon',
      'url': 'https://pokeapi.co/api/v2/pokemon/136/',
      'id': 136,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/136.png',
    },
    {
      'name': 'porygon',
      'url': 'https://pokeapi.co/api/v2/pokemon/137/',
      'id': 137,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/137.png',
    },
    {
      'name': 'omanyte',
      'url': 'https://pokeapi.co/api/v2/pokemon/138/',
      'id': 138,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/138.png',
    },
    {
      'name': 'omastar',
      'url': 'https://pokeapi.co/api/v2/pokemon/139/',
      'id': 139,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/139.png',
    },
    {
      'name': 'kabuto',
      'url': 'https://pokeapi.co/api/v2/pokemon/140/',
      'id': 140,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/140.png',
    },
    {
      'name': 'kabutops',
      'url': 'https://pokeapi.co/api/v2/pokemon/141/',
      'id': 141,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/141.png',
    },
    {
      'name': 'aerodactyl',
      'url': 'https://pokeapi.co/api/v2/pokemon/142/',
      'id': 142,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/142.png',
    },
    {
      'name': 'snorlax',
      'url': 'https://pokeapi.co/api/v2/pokemon/143/',
      'id': 143,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/143.png',
    },
    {
      'name': 'articuno',
      'url': 'https://pokeapi.co/api/v2/pokemon/144/',
      'id': 144,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/144.png',
    },
    {
      'name': 'zapdos',
      'url': 'https://pokeapi.co/api/v2/pokemon/145/',
      'id': 145,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/145.png',
    },
    {
      'name': 'moltres',
      'url': 'https://pokeapi.co/api/v2/pokemon/146/',
      'id': 146,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/146.png',
    },
    {
      'name': 'dratini',
      'url': 'https://pokeapi.co/api/v2/pokemon/147/',
      'id': 147,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/147.png',
    },
    {
      'name': 'dragonair',
      'url': 'https://pokeapi.co/api/v2/pokemon/148/',
      'id': 148,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/148.png',
    },
    {
      'name': 'dragonite',
      'url': 'https://pokeapi.co/api/v2/pokemon/149/',
      'id': 149,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/149.png',
    },
    {
      'name': 'mewtwo',
      'url': 'https://pokeapi.co/api/v2/pokemon/150/',
      'id': 150,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png',
    },
    {
      'name': 'mew',
      'url': 'https://pokeapi.co/api/v2/pokemon/151/',
      'id': 151,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/151.png',
    },
    {
      'name': 'chikorita',
      'url': 'https://pokeapi.co/api/v2/pokemon/152/',
      'id': 152,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/152.png',
    },
    {
      'name': 'bayleef',
      'url': 'https://pokeapi.co/api/v2/pokemon/153/',
      'id': 153,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/153.png',
    },
    {
      'name': 'meganium',
      'url': 'https://pokeapi.co/api/v2/pokemon/154/',
      'id': 154,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/154.png',
    },
    {
      'name': 'cyndaquil',
      'url': 'https://pokeapi.co/api/v2/pokemon/155/',
      'id': 155,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/155.png',
    },
    {
      'name': 'quilava',
      'url': 'https://pokeapi.co/api/v2/pokemon/156/',
      'id': 156,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/156.png',
    },
    {
      'name': 'typhlosion',
      'url': 'https://pokeapi.co/api/v2/pokemon/157/',
      'id': 157,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/157.png',
    },
    {
      'name': 'totodile',
      'url': 'https://pokeapi.co/api/v2/pokemon/158/',
      'id': 158,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/158.png',
    },
    {
      'name': 'croconaw',
      'url': 'https://pokeapi.co/api/v2/pokemon/159/',
      'id': 159,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/159.png',
    },
    {
      'name': 'feraligatr',
      'url': 'https://pokeapi.co/api/v2/pokemon/160/',
      'id': 160,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/160.png',
    },
    {
      'name': 'sentret',
      'url': 'https://pokeapi.co/api/v2/pokemon/161/',
      'id': 161,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/161.png',
    },
    {
      'name': 'furret',
      'url': 'https://pokeapi.co/api/v2/pokemon/162/',
      'id': 162,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/162.png',
    },
    {
      'name': 'hoothoot',
      'url': 'https://pokeapi.co/api/v2/pokemon/163/',
      'id': 163,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/163.png',
    },
    {
      'name': 'noctowl',
      'url': 'https://pokeapi.co/api/v2/pokemon/164/',
      'id': 164,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/164.png',
    },
    {
      'name': 'ledyba',
      'url': 'https://pokeapi.co/api/v2/pokemon/165/',
      'id': 165,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/165.png',
    },
    {
      'name': 'ledian',
      'url': 'https://pokeapi.co/api/v2/pokemon/166/',
      'id': 166,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/166.png',
    },
    {
      'name': 'spinarak',
      'url': 'https://pokeapi.co/api/v2/pokemon/167/',
      'id': 167,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/167.png',
    },
    {
      'name': 'ariados',
      'url': 'https://pokeapi.co/api/v2/pokemon/168/',
      'id': 168,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/168.png',
    },
    {
      'name': 'crobat',
      'url': 'https://pokeapi.co/api/v2/pokemon/169/',
      'id': 169,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/169.png',
    },
    {
      'name': 'chinchou',
      'url': 'https://pokeapi.co/api/v2/pokemon/170/',
      'id': 170,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/170.png',
    },
    {
      'name': 'lanturn',
      'url': 'https://pokeapi.co/api/v2/pokemon/171/',
      'id': 171,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/171.png',
    },
    {
      'name': 'pichu',
      'url': 'https://pokeapi.co/api/v2/pokemon/172/',
      'id': 172,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/172.png',
    },
    {
      'name': 'cleffa',
      'url': 'https://pokeapi.co/api/v2/pokemon/173/',
      'id': 173,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/173.png',
    },
    {
      'name': 'igglybuff',
      'url': 'https://pokeapi.co/api/v2/pokemon/174/',
      'id': 174,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/174.png',
    },
    {
      'name': 'togepi',
      'url': 'https://pokeapi.co/api/v2/pokemon/175/',
      'id': 175,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/175.png',
    },
    {
      'name': 'togetic',
      'url': 'https://pokeapi.co/api/v2/pokemon/176/',
      'id': 176,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/176.png',
    },
    {
      'name': 'natu',
      'url': 'https://pokeapi.co/api/v2/pokemon/177/',
      'id': 177,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/177.png',
    },
    {
      'name': 'xatu',
      'url': 'https://pokeapi.co/api/v2/pokemon/178/',
      'id': 178,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/178.png',
    },
    {
      'name': 'mareep',
      'url': 'https://pokeapi.co/api/v2/pokemon/179/',
      'id': 179,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/179.png',
    },
    {
      'name': 'flaaffy',
      'url': 'https://pokeapi.co/api/v2/pokemon/180/',
      'id': 180,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/180.png',
    },
    {
      'name': 'ampharos',
      'url': 'https://pokeapi.co/api/v2/pokemon/181/',
      'id': 181,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/181.png',
    },
    {
      'name': 'bellossom',
      'url': 'https://pokeapi.co/api/v2/pokemon/182/',
      'id': 182,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/182.png',
    },
    {
      'name': 'marill',
      'url': 'https://pokeapi.co/api/v2/pokemon/183/',
      'id': 183,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/183.png',
    },
    {
      'name': 'azumarill',
      'url': 'https://pokeapi.co/api/v2/pokemon/184/',
      'id': 184,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/184.png',
    },
    {
      'name': 'sudowoodo',
      'url': 'https://pokeapi.co/api/v2/pokemon/185/',
      'id': 185,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/185.png',
    },
    {
      'name': 'politoed',
      'url': 'https://pokeapi.co/api/v2/pokemon/186/',
      'id': 186,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/186.png',
    },
    {
      'name': 'hoppip',
      'url': 'https://pokeapi.co/api/v2/pokemon/187/',
      'id': 187,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/187.png',
    },
    {
      'name': 'skiploom',
      'url': 'https://pokeapi.co/api/v2/pokemon/188/',
      'id': 188,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/188.png',
    },
    {
      'name': 'jumpluff',
      'url': 'https://pokeapi.co/api/v2/pokemon/189/',
      'id': 189,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/189.png',
    },
    {
      'name': 'aipom',
      'url': 'https://pokeapi.co/api/v2/pokemon/190/',
      'id': 190,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/190.png',
    },
    {
      'name': 'sunkern',
      'url': 'https://pokeapi.co/api/v2/pokemon/191/',
      'id': 191,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/191.png',
    },
    {
      'name': 'sunflora',
      'url': 'https://pokeapi.co/api/v2/pokemon/192/',
      'id': 192,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/192.png',
    },
    {
      'name': 'yanma',
      'url': 'https://pokeapi.co/api/v2/pokemon/193/',
      'id': 193,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/193.png',
    },
    {
      'name': 'wooper',
      'url': 'https://pokeapi.co/api/v2/pokemon/194/',
      'id': 194,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/194.png',
    },
    {
      'name': 'quagsire',
      'url': 'https://pokeapi.co/api/v2/pokemon/195/',
      'id': 195,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/195.png',
    },
    {
      'name': 'espeon',
      'url': 'https://pokeapi.co/api/v2/pokemon/196/',
      'id': 196,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/196.png',
    },
    {
      'name': 'umbreon',
      'url': 'https://pokeapi.co/api/v2/pokemon/197/',
      'id': 197,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/197.png',
    },
    {
      'name': 'murkrow',
      'url': 'https://pokeapi.co/api/v2/pokemon/198/',
      'id': 198,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/198.png',
    },
    {
      'name': 'slowking',
      'url': 'https://pokeapi.co/api/v2/pokemon/199/',
      'id': 199,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/199.png',
    },
    {
      'name': 'misdreavus',
      'url': 'https://pokeapi.co/api/v2/pokemon/200/',
      'id': 200,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/200.png',
    },
    {
      'name': 'unown',
      'url': 'https://pokeapi.co/api/v2/pokemon/201/',
      'id': 201,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/201.png',
    },
    {
      'name': 'wobbuffet',
      'url': 'https://pokeapi.co/api/v2/pokemon/202/',
      'id': 202,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/202.png',
    },
    {
      'name': 'girafarig',
      'url': 'https://pokeapi.co/api/v2/pokemon/203/',
      'id': 203,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/203.png',
    },
    {
      'name': 'pineco',
      'url': 'https://pokeapi.co/api/v2/pokemon/204/',
      'id': 204,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/204.png',
    },
    {
      'name': 'forretress',
      'url': 'https://pokeapi.co/api/v2/pokemon/205/',
      'id': 205,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/205.png',
    },
    {
      'name': 'dunsparce',
      'url': 'https://pokeapi.co/api/v2/pokemon/206/',
      'id': 206,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/206.png',
    },
    {
      'name': 'gligar',
      'url': 'https://pokeapi.co/api/v2/pokemon/207/',
      'id': 207,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/207.png',
    },
    {
      'name': 'steelix',
      'url': 'https://pokeapi.co/api/v2/pokemon/208/',
      'id': 208,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/208.png',
    },
    {
      'name': 'snubbull',
      'url': 'https://pokeapi.co/api/v2/pokemon/209/',
      'id': 209,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/209.png',
    },
    {
      'name': 'granbull',
      'url': 'https://pokeapi.co/api/v2/pokemon/210/',
      'id': 210,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/210.png',
    },
    {
      'name': 'qwilfish',
      'url': 'https://pokeapi.co/api/v2/pokemon/211/',
      'id': 211,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/211.png',
    },
    {
      'name': 'scizor',
      'url': 'https://pokeapi.co/api/v2/pokemon/212/',
      'id': 212,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/212.png',
    },
    {
      'name': 'shuckle',
      'url': 'https://pokeapi.co/api/v2/pokemon/213/',
      'id': 213,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/213.png',
    },
    {
      'name': 'heracross',
      'url': 'https://pokeapi.co/api/v2/pokemon/214/',
      'id': 214,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/214.png',
    },
    {
      'name': 'sneasel',
      'url': 'https://pokeapi.co/api/v2/pokemon/215/',
      'id': 215,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/215.png',
    },
    {
      'name': 'teddiursa',
      'url': 'https://pokeapi.co/api/v2/pokemon/216/',
      'id': 216,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/216.png',
    },
    {
      'name': 'ursaring',
      'url': 'https://pokeapi.co/api/v2/pokemon/217/',
      'id': 217,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/217.png',
    },
    {
      'name': 'slugma',
      'url': 'https://pokeapi.co/api/v2/pokemon/218/',
      'id': 218,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/218.png',
    },
    {
      'name': 'magcargo',
      'url': 'https://pokeapi.co/api/v2/pokemon/219/',
      'id': 219,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/219.png',
    },
    {
      'name': 'swinub',
      'url': 'https://pokeapi.co/api/v2/pokemon/220/',
      'id': 220,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/220.png',
    },
    {
      'name': 'piloswine',
      'url': 'https://pokeapi.co/api/v2/pokemon/221/',
      'id': 221,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/221.png',
    },
    {
      'name': 'corsola',
      'url': 'https://pokeapi.co/api/v2/pokemon/222/',
      'id': 222,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/222.png',
    },
    {
      'name': 'remoraid',
      'url': 'https://pokeapi.co/api/v2/pokemon/223/',
      'id': 223,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/223.png',
    },
    {
      'name': 'octillery',
      'url': 'https://pokeapi.co/api/v2/pokemon/224/',
      'id': 224,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/224.png',
    },
    {
      'name': 'delibird',
      'url': 'https://pokeapi.co/api/v2/pokemon/225/',
      'id': 225,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/225.png',
    },
    {
      'name': 'mantine',
      'url': 'https://pokeapi.co/api/v2/pokemon/226/',
      'id': 226,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/226.png',
    },
    {
      'name': 'skarmory',
      'url': 'https://pokeapi.co/api/v2/pokemon/227/',
      'id': 227,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/227.png',
    },
    {
      'name': 'houndour',
      'url': 'https://pokeapi.co/api/v2/pokemon/228/',
      'id': 228,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/228.png',
    },
    {
      'name': 'houndoom',
      'url': 'https://pokeapi.co/api/v2/pokemon/229/',
      'id': 229,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/229.png',
    },
    {
      'name': 'kingdra',
      'url': 'https://pokeapi.co/api/v2/pokemon/230/',
      'id': 230,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/230.png',
    },
    {
      'name': 'phanpy',
      'url': 'https://pokeapi.co/api/v2/pokemon/231/',
      'id': 231,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/231.png',
    },
    {
      'name': 'donphan',
      'url': 'https://pokeapi.co/api/v2/pokemon/232/',
      'id': 232,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/232.png',
    },
    {
      'name': 'porygon2',
      'url': 'https://pokeapi.co/api/v2/pokemon/233/',
      'id': 233,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/233.png',
    },
    {
      'name': 'stantler',
      'url': 'https://pokeapi.co/api/v2/pokemon/234/',
      'id': 234,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/234.png',
    },
    {
      'name': 'smeargle',
      'url': 'https://pokeapi.co/api/v2/pokemon/235/',
      'id': 235,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/235.png',
    },
    {
      'name': 'tyrogue',
      'url': 'https://pokeapi.co/api/v2/pokemon/236/',
      'id': 236,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/236.png',
    },
    {
      'name': 'hitmontop',
      'url': 'https://pokeapi.co/api/v2/pokemon/237/',
      'id': 237,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/237.png',
    },
    {
      'name': 'smoochum',
      'url': 'https://pokeapi.co/api/v2/pokemon/238/',
      'id': 238,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/238.png',
    },
    {
      'name': 'elekid',
      'url': 'https://pokeapi.co/api/v2/pokemon/239/',
      'id': 239,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/239.png',
    },
    {
      'name': 'magby',
      'url': 'https://pokeapi.co/api/v2/pokemon/240/',
      'id': 240,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/240.png',
    },
    {
      'name': 'miltank',
      'url': 'https://pokeapi.co/api/v2/pokemon/241/',
      'id': 241,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/241.png',
    },
    {
      'name': 'blissey',
      'url': 'https://pokeapi.co/api/v2/pokemon/242/',
      'id': 242,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/242.png',
    },
    {
      'name': 'raikou',
      'url': 'https://pokeapi.co/api/v2/pokemon/243/',
      'id': 243,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/243.png',
    },
    {
      'name': 'entei',
      'url': 'https://pokeapi.co/api/v2/pokemon/244/',
      'id': 244,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/244.png',
    },
    {
      'name': 'suicune',
      'url': 'https://pokeapi.co/api/v2/pokemon/245/',
      'id': 245,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/245.png',
    },
    {
      'name': 'larvitar',
      'url': 'https://pokeapi.co/api/v2/pokemon/246/',
      'id': 246,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/246.png',
    },
    {
      'name': 'pupitar',
      'url': 'https://pokeapi.co/api/v2/pokemon/247/',
      'id': 247,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/247.png',
    },
    {
      'name': 'tyranitar',
      'url': 'https://pokeapi.co/api/v2/pokemon/248/',
      'id': 248,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/248.png',
    },
    {
      'name': 'lugia',
      'url': 'https://pokeapi.co/api/v2/pokemon/249/',
      'id': 249,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/249.png',
    },
    {
      'name': 'ho-oh',
      'url': 'https://pokeapi.co/api/v2/pokemon/250/',
      'id': 250,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/250.png',
    },
    {
      'name': 'celebi',
      'url': 'https://pokeapi.co/api/v2/pokemon/251/',
      'id': 251,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/251.png',
    },
    {
      'name': 'treecko',
      'url': 'https://pokeapi.co/api/v2/pokemon/252/',
      'id': 252,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/252.png',
    },
    {
      'name': 'grovyle',
      'url': 'https://pokeapi.co/api/v2/pokemon/253/',
      'id': 253,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/253.png',
    },
    {
      'name': 'sceptile',
      'url': 'https://pokeapi.co/api/v2/pokemon/254/',
      'id': 254,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/254.png',
    },
    {
      'name': 'torchic',
      'url': 'https://pokeapi.co/api/v2/pokemon/255/',
      'id': 255,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/255.png',
    },
    {
      'name': 'combusken',
      'url': 'https://pokeapi.co/api/v2/pokemon/256/',
      'id': 256,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/256.png',
    },
    {
      'name': 'blaziken',
      'url': 'https://pokeapi.co/api/v2/pokemon/257/',
      'id': 257,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/257.png',
    },
    {
      'name': 'mudkip',
      'url': 'https://pokeapi.co/api/v2/pokemon/258/',
      'id': 258,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/258.png',
    },
    {
      'name': 'marshtomp',
      'url': 'https://pokeapi.co/api/v2/pokemon/259/',
      'id': 259,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/259.png',
    },
    {
      'name': 'swampert',
      'url': 'https://pokeapi.co/api/v2/pokemon/260/',
      'id': 260,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/260.png',
    },
    {
      'name': 'poochyena',
      'url': 'https://pokeapi.co/api/v2/pokemon/261/',
      'id': 261,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/261.png',
    },
    {
      'name': 'mightyena',
      'url': 'https://pokeapi.co/api/v2/pokemon/262/',
      'id': 262,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/262.png',
    },
    {
      'name': 'zigzagoon',
      'url': 'https://pokeapi.co/api/v2/pokemon/263/',
      'id': 263,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/263.png',
    },
    {
      'name': 'linoone',
      'url': 'https://pokeapi.co/api/v2/pokemon/264/',
      'id': 264,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/264.png',
    },
    {
      'name': 'wurmple',
      'url': 'https://pokeapi.co/api/v2/pokemon/265/',
      'id': 265,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/265.png',
    },
    {
      'name': 'silcoon',
      'url': 'https://pokeapi.co/api/v2/pokemon/266/',
      'id': 266,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/266.png',
    },
    {
      'name': 'beautifly',
      'url': 'https://pokeapi.co/api/v2/pokemon/267/',
      'id': 267,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/267.png',
    },
    {
      'name': 'cascoon',
      'url': 'https://pokeapi.co/api/v2/pokemon/268/',
      'id': 268,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/268.png',
    },
    {
      'name': 'dustox',
      'url': 'https://pokeapi.co/api/v2/pokemon/269/',
      'id': 269,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/269.png',
    },
    {
      'name': 'lotad',
      'url': 'https://pokeapi.co/api/v2/pokemon/270/',
      'id': 270,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/270.png',
    },
    {
      'name': 'lombre',
      'url': 'https://pokeapi.co/api/v2/pokemon/271/',
      'id': 271,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/271.png',
    },
    {
      'name': 'ludicolo',
      'url': 'https://pokeapi.co/api/v2/pokemon/272/',
      'id': 272,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/272.png',
    },
    {
      'name': 'seedot',
      'url': 'https://pokeapi.co/api/v2/pokemon/273/',
      'id': 273,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/273.png',
    },
    {
      'name': 'nuzleaf',
      'url': 'https://pokeapi.co/api/v2/pokemon/274/',
      'id': 274,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/274.png',
    },
    {
      'name': 'shiftry',
      'url': 'https://pokeapi.co/api/v2/pokemon/275/',
      'id': 275,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/275.png',
    },
    {
      'name': 'taillow',
      'url': 'https://pokeapi.co/api/v2/pokemon/276/',
      'id': 276,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/276.png',
    },
    {
      'name': 'swellow',
      'url': 'https://pokeapi.co/api/v2/pokemon/277/',
      'id': 277,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/277.png',
    },
    {
      'name': 'wingull',
      'url': 'https://pokeapi.co/api/v2/pokemon/278/',
      'id': 278,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/278.png',
    },
    {
      'name': 'pelipper',
      'url': 'https://pokeapi.co/api/v2/pokemon/279/',
      'id': 279,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/279.png',
    },
    {
      'name': 'ralts',
      'url': 'https://pokeapi.co/api/v2/pokemon/280/',
      'id': 280,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/280.png',
    },
    {
      'name': 'kirlia',
      'url': 'https://pokeapi.co/api/v2/pokemon/281/',
      'id': 281,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/281.png',
    },
    {
      'name': 'gardevoir',
      'url': 'https://pokeapi.co/api/v2/pokemon/282/',
      'id': 282,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/282.png',
    },
    {
      'name': 'surskit',
      'url': 'https://pokeapi.co/api/v2/pokemon/283/',
      'id': 283,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/283.png',
    },
    {
      'name': 'masquerain',
      'url': 'https://pokeapi.co/api/v2/pokemon/284/',
      'id': 284,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/284.png',
    },
    {
      'name': 'shroomish',
      'url': 'https://pokeapi.co/api/v2/pokemon/285/',
      'id': 285,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/285.png',
    },
    {
      'name': 'breloom',
      'url': 'https://pokeapi.co/api/v2/pokemon/286/',
      'id': 286,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/286.png',
    },
    {
      'name': 'slakoth',
      'url': 'https://pokeapi.co/api/v2/pokemon/287/',
      'id': 287,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/287.png',
    },
    {
      'name': 'vigoroth',
      'url': 'https://pokeapi.co/api/v2/pokemon/288/',
      'id': 288,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/288.png',
    },
    {
      'name': 'slaking',
      'url': 'https://pokeapi.co/api/v2/pokemon/289/',
      'id': 289,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/289.png',
    },
    {
      'name': 'nincada',
      'url': 'https://pokeapi.co/api/v2/pokemon/290/',
      'id': 290,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/290.png',
    },
    {
      'name': 'ninjask',
      'url': 'https://pokeapi.co/api/v2/pokemon/291/',
      'id': 291,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/291.png',
    },
    {
      'name': 'shedinja',
      'url': 'https://pokeapi.co/api/v2/pokemon/292/',
      'id': 292,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/292.png',
    },
    {
      'name': 'whismur',
      'url': 'https://pokeapi.co/api/v2/pokemon/293/',
      'id': 293,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/293.png',
    },
    {
      'name': 'loudred',
      'url': 'https://pokeapi.co/api/v2/pokemon/294/',
      'id': 294,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/294.png',
    },
    {
      'name': 'exploud',
      'url': 'https://pokeapi.co/api/v2/pokemon/295/',
      'id': 295,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/295.png',
    },
    {
      'name': 'makuhita',
      'url': 'https://pokeapi.co/api/v2/pokemon/296/',
      'id': 296,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/296.png',
    },
    {
      'name': 'hariyama',
      'url': 'https://pokeapi.co/api/v2/pokemon/297/',
      'id': 297,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/297.png',
    },
    {
      'name': 'azurill',
      'url': 'https://pokeapi.co/api/v2/pokemon/298/',
      'id': 298,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/298.png',
    },
    {
      'name': 'nosepass',
      'url': 'https://pokeapi.co/api/v2/pokemon/299/',
      'id': 299,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/299.png',
    },
    {
      'name': 'skitty',
      'url': 'https://pokeapi.co/api/v2/pokemon/300/',
      'id': 300,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/300.png',
    },
    {
      'name': 'delcatty',
      'url': 'https://pokeapi.co/api/v2/pokemon/301/',
      'id': 301,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/301.png',
    },
    {
      'name': 'sableye',
      'url': 'https://pokeapi.co/api/v2/pokemon/302/',
      'id': 302,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/302.png',
    },
    {
      'name': 'mawile',
      'url': 'https://pokeapi.co/api/v2/pokemon/303/',
      'id': 303,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/303.png',
    },
    {
      'name': 'aron',
      'url': 'https://pokeapi.co/api/v2/pokemon/304/',
      'id': 304,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/304.png',
    },
    {
      'name': 'lairon',
      'url': 'https://pokeapi.co/api/v2/pokemon/305/',
      'id': 305,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/305.png',
    },
    {
      'name': 'aggron',
      'url': 'https://pokeapi.co/api/v2/pokemon/306/',
      'id': 306,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/306.png',
    },
    {
      'name': 'meditite',
      'url': 'https://pokeapi.co/api/v2/pokemon/307/',
      'id': 307,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/307.png',
    },
    {
      'name': 'medicham',
      'url': 'https://pokeapi.co/api/v2/pokemon/308/',
      'id': 308,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/308.png',
    },
    {
      'name': 'electrike',
      'url': 'https://pokeapi.co/api/v2/pokemon/309/',
      'id': 309,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/309.png',
    },
    {
      'name': 'manectric',
      'url': 'https://pokeapi.co/api/v2/pokemon/310/',
      'id': 310,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/310.png',
    },
    {
      'name': 'plusle',
      'url': 'https://pokeapi.co/api/v2/pokemon/311/',
      'id': 311,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/311.png',
    },
    {
      'name': 'minun',
      'url': 'https://pokeapi.co/api/v2/pokemon/312/',
      'id': 312,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/312.png',
    },
    {
      'name': 'volbeat',
      'url': 'https://pokeapi.co/api/v2/pokemon/313/',
      'id': 313,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/313.png',
    },
    {
      'name': 'illumise',
      'url': 'https://pokeapi.co/api/v2/pokemon/314/',
      'id': 314,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/314.png',
    },
    {
      'name': 'roselia',
      'url': 'https://pokeapi.co/api/v2/pokemon/315/',
      'id': 315,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/315.png',
    },
    {
      'name': 'gulpin',
      'url': 'https://pokeapi.co/api/v2/pokemon/316/',
      'id': 316,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/316.png',
    },
    {
      'name': 'swalot',
      'url': 'https://pokeapi.co/api/v2/pokemon/317/',
      'id': 317,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/317.png',
    },
    {
      'name': 'carvanha',
      'url': 'https://pokeapi.co/api/v2/pokemon/318/',
      'id': 318,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/318.png',
    },
    {
      'name': 'sharpedo',
      'url': 'https://pokeapi.co/api/v2/pokemon/319/',
      'id': 319,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/319.png',
    },
    {
      'name': 'wailmer',
      'url': 'https://pokeapi.co/api/v2/pokemon/320/',
      'id': 320,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/320.png',
    },
    {
      'name': 'wailord',
      'url': 'https://pokeapi.co/api/v2/pokemon/321/',
      'id': 321,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/321.png',
    },
    {
      'name': 'numel',
      'url': 'https://pokeapi.co/api/v2/pokemon/322/',
      'id': 322,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/322.png',
    },
    {
      'name': 'camerupt',
      'url': 'https://pokeapi.co/api/v2/pokemon/323/',
      'id': 323,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/323.png',
    },
    {
      'name': 'torkoal',
      'url': 'https://pokeapi.co/api/v2/pokemon/324/',
      'id': 324,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/324.png',
    },
    {
      'name': 'spoink',
      'url': 'https://pokeapi.co/api/v2/pokemon/325/',
      'id': 325,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/325.png',
    },
    {
      'name': 'grumpig',
      'url': 'https://pokeapi.co/api/v2/pokemon/326/',
      'id': 326,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/326.png',
    },
    {
      'name': 'spinda',
      'url': 'https://pokeapi.co/api/v2/pokemon/327/',
      'id': 327,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/327.png',
    },
    {
      'name': 'trapinch',
      'url': 'https://pokeapi.co/api/v2/pokemon/328/',
      'id': 328,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/328.png',
    },
    {
      'name': 'vibrava',
      'url': 'https://pokeapi.co/api/v2/pokemon/329/',
      'id': 329,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/329.png',
    },
    {
      'name': 'flygon',
      'url': 'https://pokeapi.co/api/v2/pokemon/330/',
      'id': 330,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/330.png',
    },
    {
      'name': 'cacnea',
      'url': 'https://pokeapi.co/api/v2/pokemon/331/',
      'id': 331,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/331.png',
    },
    {
      'name': 'cacturne',
      'url': 'https://pokeapi.co/api/v2/pokemon/332/',
      'id': 332,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/332.png',
    },
    {
      'name': 'swablu',
      'url': 'https://pokeapi.co/api/v2/pokemon/333/',
      'id': 333,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/333.png',
    },
    {
      'name': 'altaria',
      'url': 'https://pokeapi.co/api/v2/pokemon/334/',
      'id': 334,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/334.png',
    },
    {
      'name': 'zangoose',
      'url': 'https://pokeapi.co/api/v2/pokemon/335/',
      'id': 335,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/335.png',
    },
    {
      'name': 'seviper',
      'url': 'https://pokeapi.co/api/v2/pokemon/336/',
      'id': 336,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/336.png',
    },
    {
      'name': 'lunatone',
      'url': 'https://pokeapi.co/api/v2/pokemon/337/',
      'id': 337,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/337.png',
    },
    {
      'name': 'solrock',
      'url': 'https://pokeapi.co/api/v2/pokemon/338/',
      'id': 338,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/338.png',
    },
    {
      'name': 'barboach',
      'url': 'https://pokeapi.co/api/v2/pokemon/339/',
      'id': 339,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/339.png',
    },
    {
      'name': 'whiscash',
      'url': 'https://pokeapi.co/api/v2/pokemon/340/',
      'id': 340,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/340.png',
    },
    {
      'name': 'corphish',
      'url': 'https://pokeapi.co/api/v2/pokemon/341/',
      'id': 341,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/341.png',
    },
    {
      'name': 'crawdaunt',
      'url': 'https://pokeapi.co/api/v2/pokemon/342/',
      'id': 342,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/342.png',
    },
    {
      'name': 'baltoy',
      'url': 'https://pokeapi.co/api/v2/pokemon/343/',
      'id': 343,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/343.png',
    },
    {
      'name': 'claydol',
      'url': 'https://pokeapi.co/api/v2/pokemon/344/',
      'id': 344,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/344.png',
    },
    {
      'name': 'lileep',
      'url': 'https://pokeapi.co/api/v2/pokemon/345/',
      'id': 345,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/345.png',
    },
    {
      'name': 'cradily',
      'url': 'https://pokeapi.co/api/v2/pokemon/346/',
      'id': 346,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/346.png',
    },
    {
      'name': 'anorith',
      'url': 'https://pokeapi.co/api/v2/pokemon/347/',
      'id': 347,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/347.png',
    },
    {
      'name': 'armaldo',
      'url': 'https://pokeapi.co/api/v2/pokemon/348/',
      'id': 348,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/348.png',
    },
    {
      'name': 'feebas',
      'url': 'https://pokeapi.co/api/v2/pokemon/349/',
      'id': 349,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/349.png',
    },
    {
      'name': 'milotic',
      'url': 'https://pokeapi.co/api/v2/pokemon/350/',
      'id': 350,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/350.png',
    },
    {
      'name': 'celebi',
      'url': 'https://pokeapi.co/api/v2/pokemon/251/',
      'id': 251,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/251.png',
    },
    {
      'name': 'treecko',
      'url': 'https://pokeapi.co/api/v2/pokemon/252/',
      'id': 252,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/252.png',
    },
    {
      'name': 'grovyle',
      'url': 'https://pokeapi.co/api/v2/pokemon/253/',
      'id': 253,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/253.png',
    },
    {
      'name': 'sceptile',
      'url': 'https://pokeapi.co/api/v2/pokemon/254/',
      'id': 254,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/254.png',
    },
    {
      'name': 'torchic',
      'url': 'https://pokeapi.co/api/v2/pokemon/255/',
      'id': 255,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/255.png',
    },
    {
      'name': 'combusken',
      'url': 'https://pokeapi.co/api/v2/pokemon/256/',
      'id': 256,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/256.png',
    },
    {
      'name': 'blaziken',
      'url': 'https://pokeapi.co/api/v2/pokemon/257/',
      'id': 257,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/257.png',
    },
    {
      'name': 'mudkip',
      'url': 'https://pokeapi.co/api/v2/pokemon/258/',
      'id': 258,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/258.png',
    },
    {
      'name': 'marshtomp',
      'url': 'https://pokeapi.co/api/v2/pokemon/259/',
      'id': 259,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/259.png',
    },
    {
      'name': 'swampert',
      'url': 'https://pokeapi.co/api/v2/pokemon/260/',
      'id': 260,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/260.png',
    },
    {
      'name': 'poochyena',
      'url': 'https://pokeapi.co/api/v2/pokemon/261/',
      'id': 261,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/261.png',
    },
    {
      'name': 'mightyena',
      'url': 'https://pokeapi.co/api/v2/pokemon/262/',
      'id': 262,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/262.png',
    },
    {
      'name': 'zigzagoon',
      'url': 'https://pokeapi.co/api/v2/pokemon/263/',
      'id': 263,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/263.png',
    },
    {
      'name': 'linoone',
      'url': 'https://pokeapi.co/api/v2/pokemon/264/',
      'id': 264,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/264.png',
    },
    {
      'name': 'wurmple',
      'url': 'https://pokeapi.co/api/v2/pokemon/265/',
      'id': 265,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/265.png',
    },
    {
      'name': 'silcoon',
      'url': 'https://pokeapi.co/api/v2/pokemon/266/',
      'id': 266,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/266.png',
    },
    {
      'name': 'beautifly',
      'url': 'https://pokeapi.co/api/v2/pokemon/267/',
      'id': 267,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/267.png',
    },
    {
      'name': 'cascoon',
      'url': 'https://pokeapi.co/api/v2/pokemon/268/',
      'id': 268,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/268.png',
    },
    {
      'name': 'dustox',
      'url': 'https://pokeapi.co/api/v2/pokemon/269/',
      'id': 269,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/269.png',
    },
    {
      'name': 'lotad',
      'url': 'https://pokeapi.co/api/v2/pokemon/270/',
      'id': 270,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/270.png',
    },
    {
      'name': 'lombre',
      'url': 'https://pokeapi.co/api/v2/pokemon/271/',
      'id': 271,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/271.png',
    },
    {
      'name': 'ludicolo',
      'url': 'https://pokeapi.co/api/v2/pokemon/272/',
      'id': 272,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/272.png',
    },
    {
      'name': 'seedot',
      'url': 'https://pokeapi.co/api/v2/pokemon/273/',
      'id': 273,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/273.png',
    },
    {
      'name': 'nuzleaf',
      'url': 'https://pokeapi.co/api/v2/pokemon/274/',
      'id': 274,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/274.png',
    },
    {
      'name': 'shiftry',
      'url': 'https://pokeapi.co/api/v2/pokemon/275/',
      'id': 275,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/275.png',
    },
    {
      'name': 'taillow',
      'url': 'https://pokeapi.co/api/v2/pokemon/276/',
      'id': 276,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/276.png',
    },
    {
      'name': 'swellow',
      'url': 'https://pokeapi.co/api/v2/pokemon/277/',
      'id': 277,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/277.png',
    },
    {
      'name': 'wingull',
      'url': 'https://pokeapi.co/api/v2/pokemon/278/',
      'id': 278,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/278.png',
    },
    {
      'name': 'pelipper',
      'url': 'https://pokeapi.co/api/v2/pokemon/279/',
      'id': 279,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/279.png',
    },
    {
      'name': 'ralts',
      'url': 'https://pokeapi.co/api/v2/pokemon/280/',
      'id': 280,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/280.png',
    },
    {
      'name': 'kirlia',
      'url': 'https://pokeapi.co/api/v2/pokemon/281/',
      'id': 281,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/281.png',
    },
    {
      'name': 'gardevoir',
      'url': 'https://pokeapi.co/api/v2/pokemon/282/',
      'id': 282,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/282.png',
    },
    {
      'name': 'surskit',
      'url': 'https://pokeapi.co/api/v2/pokemon/283/',
      'id': 283,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/283.png',
    },
    {
      'name': 'masquerain',
      'url': 'https://pokeapi.co/api/v2/pokemon/284/',
      'id': 284,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/284.png',
    },
    {
      'name': 'shroomish',
      'url': 'https://pokeapi.co/api/v2/pokemon/285/',
      'id': 285,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/285.png',
    },
    {
      'name': 'breloom',
      'url': 'https://pokeapi.co/api/v2/pokemon/286/',
      'id': 286,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/286.png',
    },
    {
      'name': 'slakoth',
      'url': 'https://pokeapi.co/api/v2/pokemon/287/',
      'id': 287,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/287.png',
    },
    {
      'name': 'vigoroth',
      'url': 'https://pokeapi.co/api/v2/pokemon/288/',
      'id': 288,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/288.png',
    },
    {
      'name': 'slaking',
      'url': 'https://pokeapi.co/api/v2/pokemon/289/',
      'id': 289,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/289.png',
    },
    {
      'name': 'nincada',
      'url': 'https://pokeapi.co/api/v2/pokemon/290/',
      'id': 290,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/290.png',
    },
    {
      'name': 'ninjask',
      'url': 'https://pokeapi.co/api/v2/pokemon/291/',
      'id': 291,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/291.png',
    },
    {
      'name': 'shedinja',
      'url': 'https://pokeapi.co/api/v2/pokemon/292/',
      'id': 292,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/292.png',
    },
    {
      'name': 'whismur',
      'url': 'https://pokeapi.co/api/v2/pokemon/293/',
      'id': 293,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/293.png',
    },
    {
      'name': 'loudred',
      'url': 'https://pokeapi.co/api/v2/pokemon/294/',
      'id': 294,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/294.png',
    },
    {
      'name': 'exploud',
      'url': 'https://pokeapi.co/api/v2/pokemon/295/',
      'id': 295,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/295.png',
    },
    {
      'name': 'makuhita',
      'url': 'https://pokeapi.co/api/v2/pokemon/296/',
      'id': 296,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/296.png',
    },
    {
      'name': 'hariyama',
      'url': 'https://pokeapi.co/api/v2/pokemon/297/',
      'id': 297,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/297.png',
    },
    {
      'name': 'azurill',
      'url': 'https://pokeapi.co/api/v2/pokemon/298/',
      'id': 298,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/298.png',
    },
    {
      'name': 'nosepass',
      'url': 'https://pokeapi.co/api/v2/pokemon/299/',
      'id': 299,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/299.png',
    },
    {
      'name': 'skitty',
      'url': 'https://pokeapi.co/api/v2/pokemon/300/',
      'id': 300,
      'imageUrl':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/300.png',
    }
  ],
};
