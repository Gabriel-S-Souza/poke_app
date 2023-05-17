import '../../../../../shared/domain/entities/result/result.dart';

abstract class PokemonDataSource {
  Future<Result> getPokemons(int page);
}
