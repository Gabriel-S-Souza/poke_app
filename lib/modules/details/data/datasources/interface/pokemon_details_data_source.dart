import '../../../../../shared/domain/entities/result/result.dart';
import '../../../domain/entities/pokemon_details_entity.dart';

abstract class PokemonDetailsDataSource {
  Future<Result<PokemonDetailsEntity>> getDetails(int pokemonId);
}
