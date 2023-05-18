import '../../../../shared/domain/entities/result/result.dart';
import '../../domain/entities/pokemon_details_entity.dart';
import '../../domain/repositories/pokemon_details_repository.dart';
import '../datasources/interface/pokemon_details_data_source.dart';

class PokemonDetailsRepositoryImp implements PokemonDetailsRepository {
  final PokemonDetailsDataSource _pokemonDetailsDataSource;

  PokemonDetailsRepositoryImp({
    required PokemonDetailsDataSource pokemonDetailsDataSource,
  }) : _pokemonDetailsDataSource = pokemonDetailsDataSource;

  @override
  Future<Result<PokemonDetailsEntity>> getDetails(int pokemonId) =>
      _pokemonDetailsDataSource.getDetails(pokemonId);
}
