import '../../../../shared/domain/entities/result/result.dart';

abstract class GetPokemonsUseCase {
  Future<Result> getPokemons();
}

class GetPokemonsUseCaseImp implements GetPokemonsUseCase {
  @override
  Future<Result> getPokemons() {
    // TODO: implement getPokemons
    throw UnimplementedError();
  }
}
