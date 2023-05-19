import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_app/modules/home/domain/entities/pokemon_entity.dart';
import 'package:poke_app/modules/home/domain/repositories/pokemon_repository_interface.dart';
import 'package:poke_app/modules/home/domain/usecases/pokemon_use_case.dart';
import 'package:poke_app/shared/domain/entities/failure/failure.dart';
import 'package:poke_app/shared/domain/entities/result/result.dart';

import '../../mocks/mock_pokemons.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late GetPokemonsUseCaseImp useCase;
  late MockPokemonRepository mockRepository;

  setUp(() {
    mockRepository = MockPokemonRepository();
    useCase = GetPokemonsUseCaseImp(pokemonRepository: mockRepository);
  });

  group('GetPokemonsUseCase |', () {
    test('success: should return a list of PokemonEntity', () async {
      // Arrange
      final List<PokemonEntity> pokemons = mockPokemons;

      when(() => mockRepository.getPokemons(any()))
          .thenAnswer((invocation) async => Result.success(pokemons));

      // Act
      final result = await useCase.call(1);

      // Assert
      expect(result.isSuccess, isTrue);
      expect(result.data, pokemons);

      verify(() => mockRepository.getPokemons(1)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('failure: should return a Failure', () async {
      // Arrange
      const String errorMessage = 'Failed to fetch Pokemons';

      when(() => mockRepository.getPokemons(any()))
          .thenAnswer((invocation) async => const Result.failure(Failure(errorMessage)));

      // Act
      final result = await useCase.call(1);

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.error.message, errorMessage);

      verify(() => mockRepository.getPokemons(1)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
