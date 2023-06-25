import '../../../../../../shared/domain/entities/result/result.dart';
import '../../../../domain/entities/pokemon_entity.dart';

abstract class PokemonDataSource {
  Future<Result<List<PokemonEntity>>> getPokemons(int page);
}
