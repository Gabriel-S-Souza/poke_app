import '../../../../shared/domain/entities/result/result.dart';
import '../entities/pokemon_details_entity.dart';
import '../repositories/pokemon_details_repository.dart';

abstract class GetPokemonDetailsUseCase {
  Future<Result<PokemonDetailsEntity>> call(int pokemonId);
}

class GetPokemonDetailsUseCaseImp implements GetPokemonDetailsUseCase {
  final PokemonDetailsRepository _pokemonDetailsRepository;

  GetPokemonDetailsUseCaseImp({
    required PokemonDetailsRepository pokemonDetailsRepository,
  }) : _pokemonDetailsRepository = pokemonDetailsRepository;

  @override
  Future<Result<PokemonDetailsEntity>> call(int pokemonId) =>
      _pokemonDetailsRepository.getDetails(pokemonId);
}
