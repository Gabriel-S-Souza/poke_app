import '../../../../shared/domain/entities/result/result.dart';
import '../entities/pokemon_entity.dart';
import '../repositories/pokemon_repository_interface.dart';

abstract class GetPokemonsUseCase {
  Future<Result<List<PokemonEntity>>> call(int page);
}

class GetPokemonsUseCaseImp implements GetPokemonsUseCase {
  final PokemonRepository _pokemonRepository;

  GetPokemonsUseCaseImp({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  @override
  Future<Result<List<PokemonEntity>>> call(int page) => _pokemonRepository.getPokemons(page);
}
