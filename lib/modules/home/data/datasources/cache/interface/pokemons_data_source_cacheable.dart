import '../../../../../../shared/domain/entities/result/result.dart';
import '../../../../domain/entities/pokemon_entity.dart';
import '../../remote/interface/pokemon_data_source.dart';

abstract class PokemonDataSourceCacheable implements PokemonDataSource {
  final PokemonDataSource _pokemonDataSource;

  PokemonDataSourceCacheable({
    required PokemonDataSource pokemonDataSource,
  }) : _pokemonDataSource = pokemonDataSource;

  @override
  Future<Result<List<PokemonEntity>>> getPokemons(int page) => _pokemonDataSource.getPokemons(page);
}
