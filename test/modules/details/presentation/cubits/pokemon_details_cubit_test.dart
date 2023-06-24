import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_app/modules/details/domain/usecases/get_pokemon_details_use_case.dart';
import 'package:poke_app/modules/details/presentation/cubits/pokemon_details_cubit.dart';
import 'package:poke_app/modules/details/presentation/cubits/pokemon_details_state.dart';
import 'package:poke_app/shared/domain/entities/failure/failure.dart';
import 'package:poke_app/shared/domain/entities/result/result.dart';
import 'package:poke_app/shared/presentation/toast/controller/toast.dart';

import '../../../../mocks/pokemon_details_mock.dart';

class MockGetPokemonDetailsUseCase extends Mock implements GetPokemonDetailsUseCase {}

void main() {
  late PokemonDetailsCubit pokemonDetailsCubit;
  late MockGetPokemonDetailsUseCase mockGetPokemonDetailsUseCase;
  const pokemonId = 1;
  const String errorMessage = 'Failed to fetch Pokemon details';

  setUp(() {
    mockGetPokemonDetailsUseCase = MockGetPokemonDetailsUseCase();
    pokemonDetailsCubit =
        PokemonDetailsCubit(getPokemonDetailsUseCase: mockGetPokemonDetailsUseCase);
  });

  setUpAll(() {
    Toast.initialize();
  });

  group('PokemonDetailsCubit.getDetails |', () {
    test('initial: should have the correct initial state', () {
      expect(pokemonDetailsCubit.state, isA<PokemonDetailsInitial>());
    });

    blocTest(
      'success: should emit PokemonDetailsLoading and then PokemonDetailsSuccess with the fetched details',
      // Arrange
      build: () {
        when(() => mockGetPokemonDetailsUseCase.call(pokemonId))
            .thenAnswer((_) async => Result.success(pokemonDetailsMock));
        return pokemonDetailsCubit;
      },

      // Act
      act: (cubit) => cubit.getDetails(pokemonId),

      // Assert
      expect: () => [
        isA<PokemonDetailsLoading>(),
        isA<PokemonDetailsSuccess>()
            .having((state) => state.pokemonDetails, 'pokemonDetails', equals(pokemonDetailsMock)),
      ],
      verify: (_) {
        verify(() => mockGetPokemonDetailsUseCase.call(pokemonId)).called(1);
        verifyNoMoreInteractions(mockGetPokemonDetailsUseCase);
      },
    );

    blocTest(
      'failure: should emit PokemonDetailsLoading and then PokemonDetailsError when response from use case is unsuccessful',
      // Arrange
      build: () {
        const failure = Failure(errorMessage);
        when(() => mockGetPokemonDetailsUseCase.call(pokemonId))
            .thenAnswer((_) async => Result.failure(failure));
        return pokemonDetailsCubit;
      },

      // Act
      act: (cubit) => cubit.getDetails(pokemonId),

      // Assert
      expect: () => [
        isA<PokemonDetailsLoading>(),
        isA<PokemonDetailsError>()
            .having((state) => state.message, 'message', equals(errorMessage)),
      ],
      verify: (_) {
        verify(() => mockGetPokemonDetailsUseCase.call(pokemonId)).called(1);
        verifyNoMoreInteractions(mockGetPokemonDetailsUseCase);
      },
    );
  });
}
