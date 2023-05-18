import '../../../../shared/domain/entities/result/result.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/repositories/pokemon_repository_interface.dart';
import '../datasources/interface/pokemon_data_source.dart';

class PokemonRepositoryImp implements PokemonRepository {
  final PokemonDataSource _pokemonDataSource;

  PokemonRepositoryImp({
    required PokemonDataSource pokemonDataSource,
  }) : _pokemonDataSource = pokemonDataSource;

  @override
  Future<Result<List<PokemonEntity>>> getPokemons(int page) => _pokemonDataSource.getPokemons(page);
}
