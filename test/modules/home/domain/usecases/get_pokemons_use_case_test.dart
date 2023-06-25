import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_app/modules/home/domain/entities/pokemon_entity.dart';
import 'package:poke_app/modules/home/domain/repositories/pokemon_repository_interface.dart';
import 'package:poke_app/modules/home/domain/usecases/pokemon_use_case.dart';
import 'package:poke_app/shared/domain/entities/failure/failure.dart';
import 'package:poke_app/shared/domain/entities/result/result.dart';

import '../../../../mocks/pokemons_mock.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late GetPokemonsUseCaseImp useCase;
  late MockPokemonRepository mockRepository;

  setUp(() {
    mockRepository = MockPokemonRepository();
    useCase = GetPokemonsUseCaseImp(pokemonRepository: mockRepository);
  });

  group('GetPokemonsUseCase |', () {
    test('success: hould return a Result with a list of PokemonEntity', () async {
      // Arrange
      final List<PokemonEntity> pokemons = pokemonsMock;

      when(() => mockRepository.getPokemons(any()))
          .thenAnswer((invocation) async => Result.success(pokemons));

      // Act
      final result = await useCase.call(1);

      // Assert
      expect(result.isSuccess, isTrue);
      expect(result.data, isA<List<PokemonEntity>>());

      verify(() => mockRepository.getPokemons(1)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test(
        'failure: should return a Result with a Failure when the response of the repository is unsuccessful',
        () async {
      // Arrange
      const String errorMessage = 'Failed to fetch Pokemons';

      when(() => mockRepository.getPokemons(any()))
          .thenAnswer((invocation) async => Result.failure(const Failure(errorMessage)));

      // Act
      final result = await useCase.call(1);

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.failure, isA<Failure>());
      expect(result.failure.message, errorMessage);

      verify(() => mockRepository.getPokemons(1)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
