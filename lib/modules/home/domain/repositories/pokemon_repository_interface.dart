import '../../../../shared/domain/entities/result/result.dart';
import '../entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Result<List<PokemonEntity>>> getPokemons(int page);
}
