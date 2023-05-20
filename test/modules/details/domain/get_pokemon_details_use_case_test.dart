import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_app/modules/details/domain/entities/pokemon_details_entity.dart';
import 'package:poke_app/modules/details/domain/repositories/pokemon_details_repository.dart';
import 'package:poke_app/modules/details/domain/usecases/get_pokemon_details_use_case.dart';
import 'package:poke_app/shared/domain/entities/failure/failure.dart';
import 'package:poke_app/shared/domain/entities/result/result.dart';

import '../mocks/mock_pokemon_details.dart';

class MockPokemonDetailsRepository extends Mock implements PokemonDetailsRepository {}

void main() {
  late GetPokemonDetailsUseCaseImp useCase;
  late MockPokemonDetailsRepository mockRepository;

  setUp(() {
    mockRepository = MockPokemonDetailsRepository();
    useCase = GetPokemonDetailsUseCaseImp(
      pokemonDetailsRepository: mockRepository,
    );
  });

  group('GetPokemonDetailsUseCase |', () {
    test('success: should return a Result with a PokemonDetailsEntity', () async {
      // Arrange
      final PokemonDetailsEntity pokemonDetails = mockPokemonDetails;

      when(() => mockRepository.getDetails(any()))
          .thenAnswer((invocation) async => Result.success(pokemonDetails));

      // Act
      final result = await useCase.call(1);

      // Assert
      expect(result.isSuccess, isTrue);
      expect(result.data, isA<PokemonDetailsEntity>());

      verify(() => mockRepository.getDetails(1)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test(
        'failure: should return a Result with a Failure when the response of the repository is not successful',
        () async {
      // Arrange
      const String mockErrorMessage = 'Failed to fetch Pokemon details';

      when(() => mockRepository.getDetails(any()))
          .thenAnswer((invocation) async => Result.failure(const Failure(mockErrorMessage)));

      // Act
      final result = await useCase.call(1);

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.error, isA<Failure>());
      expect(result.error.message, mockErrorMessage);

      verify(() => mockRepository.getDetails(1)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
