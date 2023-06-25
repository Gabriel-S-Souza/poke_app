import 'dart:convert';

import '../../../../../../shared/data/datasources/interface/local_storage.dart';
import '../../../../../../shared/domain/entities/failure/failure.dart';
import '../../../../../../shared/domain/entities/result/result.dart';
import '../../../../domain/entities/pokemon_entity.dart';
import '../../../models/pokemon_model.dart';
import '../interface/pokemons_data_source_cacheable.dart';

class PokemonDataSourceCacheableImp extends PokemonDataSourceCacheable {
  final LocalStorage _localStorage;
  final String _storageKey = 'pokemons';

  PokemonDataSourceCacheableImp({
    required super.pokemonDataSource,
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  @override
  Future<Result<List<PokemonEntity>>> getPokemons(int page) async {
    final result = await super.getPokemons(page);

    if (result.isSuccess) {
      _saveInCache(result.data);
      return Result.success(result.data);
    } else {
      final cachedPokemons = page == 0 ? _getFromCache() : <PokemonEntity>[];
      return Result.failure(const OfflineFailure(), cachedPokemons);
    }
  }

  void _saveInCache(List<PokemonEntity> pokemons) {
    final pokemonsJson =
        pokemons.map((pokemon) => jsonEncode(PokemonModel.fromEntity(pokemon).toJson())).toList();
    _localStorage.setList(key: _storageKey, value: pokemonsJson);
  }

  List<PokemonEntity> _getFromCache() {
    final pokemonsJson = _localStorage.getList(_storageKey);
    if (pokemonsJson != null) {
      final pokemons = pokemonsJson.map((pokemonJson) {
        final pokemonMap = jsonDecode(pokemonJson);
        return PokemonModel.fromJson(pokemonMap);
      }).toList();
      return pokemons;
    } else {
      return [];
    }
  }
}
