import '../../../../shared/domain/entities/result/result.dart';
import '../entities/pokemon_details_entity.dart';

abstract class PokemonDetailsRepository {
  Future<Result<PokemonDetailsEntity>> getDetails(int pokemonId);
}
