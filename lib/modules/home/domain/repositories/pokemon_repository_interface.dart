import '../../../../shared/domain/entities/result/result.dart';

abstract class PokemonRepository {
  Future<Result> getPokemons(int page);
}
