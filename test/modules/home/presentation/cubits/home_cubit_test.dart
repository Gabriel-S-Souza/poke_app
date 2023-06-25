import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_app/modules/home/domain/entities/pokemon_entity.dart';
import 'package:poke_app/modules/home/domain/usecases/pokemon_use_case.dart';
import 'package:poke_app/modules/home/presentation/cubits/home_cubit.dart';
import 'package:poke_app/modules/home/presentation/cubits/home_state.dart';
import 'package:poke_app/modules/home/presentation/view/widgets/radio_tile_widget.dart';
import 'package:poke_app/shared/domain/entities/failure/failure.dart';
import 'package:poke_app/shared/domain/entities/result/result.dart';
import 'package:poke_app/shared/presentation/toast/controller/toast.dart';

import '../../../../mocks/pokemons_mock.dart';

class MockGetPokemonsUseCase extends Mock implements GetPokemonsUseCaseImp {}

void main() {
  late HomeCubit homeCubit;
  late MockGetPokemonsUseCase mockGetPokemonsUseCase;

  setUp(() {
    mockGetPokemonsUseCase = MockGetPokemonsUseCase();
    homeCubit = HomeCubit(getPokemonsUseCase: mockGetPokemonsUseCase);
  });

  setUpAll(() {
    Toast.initialize();
  });

  group('HomeCubit.getPokemons |', () {
    test('initial: should have the correct initial state', () {
      expect(
          homeCubit.state,
          isA<HomeState>()
              .having((state) => state.isLoading, 'isLoading', equals(false))
              .having((state) => state.hasError, 'hasError', equals(false))
              .having((state) => state.messageError, 'messageError', isNull)
              .having((state) => state.pokemons, 'pokemons', equals(<PokemonEntity>[]))
              .having((state) => state.searchText, 'searchText', equals('')));
    });

    blocTest(
      'success: should emit HomeState with loading and then emit HomeState with the fetched pokemon',
      // Arrange
      build: () {
        when(() => mockGetPokemonsUseCase.call(0))
            .thenAnswer((invocation) async => Result.success(pokemonsMock));
        return homeCubit;
      },

      // Act
      act: (HomeCubit cubit) => cubit.getPokemons(0),

      // Assert
      expect: () => [
        isA<HomeState>().having((state) => state.isLoading, 'isLoading', equals(true)),
        isA<HomeState>().having((state) => state.pokemons, 'pokemons', equals(pokemonsMock)),
      ],
      verify: (_) {
        verify(() => mockGetPokemonsUseCase.call(0)).called(1);
        verifyNoMoreInteractions(mockGetPokemonsUseCase);
      },
    );

    blocTest(
      'failure: should emit a HomeSate with failure when response from use case is unsuccessful. Should have a cached pokemons if any',
      // Arrange
      build: () {
        const String errorMessage = 'Failed to fetch Pokemons';
        final failureResult = Result<List<PokemonEntity>>.failure(
          const Failure(errorMessage),
          pokemonsMock,
        );

        when(() => mockGetPokemonsUseCase.call(0)).thenAnswer((invocation) async => failureResult);
        return homeCubit;
      },

      // Act
      act: (HomeCubit cubit) => cubit.getPokemons(0),

      // Assert
      expect: () => [
        isA<HomeState>().having((state) => state.isLoading, 'isLoading', true),
        isA<HomeState>()
            .having((state) => state.hasError, 'hasError', equals(true))
            .having((state) => state.messageError, 'messageError', allOf(isNotNull, isNotEmpty)),
      ],
      verify: (_) {
        verify(() => mockGetPokemonsUseCase.call(0)).called(1);
        verifyNoMoreInteractions(mockGetPokemonsUseCase);
      },
    );
  });

  group('HomeCubit.nextPage |', () {
    test('success: should increment the page and call getPokemons passing the new page value',
        () async {
      // Arrange
      final initialPage = homeCubit.page;
      final expectedPage = initialPage + 1;

      when(() => mockGetPokemonsUseCase.call(expectedPage))
          .thenAnswer((_) async => Result.success([]));

      // Act
      await homeCubit.nextPage();

      // Assert
      expect(homeCubit.page, equals(expectedPage));
      verify(() => mockGetPokemonsUseCase.call(expectedPage)).called(1);
    });

    test('failure: should return to previous page value when getPokemons is unsuccessful',
        () async {
      // Arrange
      final initialPage = homeCubit.page;
      final incrementedPage = initialPage + 1;

      const String errorMessage = 'Failed to fetch Pokemons';
      const failure = Failure(errorMessage);
      when(() => mockGetPokemonsUseCase.call(incrementedPage))
          .thenAnswer((_) async => Result.failure(failure));

      // Act
      await homeCubit.nextPage();

      // Assert
      expect(homeCubit.page, equals(initialPage));
      verify(() => mockGetPokemonsUseCase.call(incrementedPage)).called(1);
    });
  });

  group('HomeCubit.sortPokemons |', () {
    test(
        'should sort by number the pokemons parameter and emit a new state with the sorted pokemons',
        () async {
      // Arrange
      when(() => mockGetPokemonsUseCase.call(0))
          .thenAnswer((invocation) async => Result.success(pokemonsMock));
      await homeCubit.getPokemons(0);

      final previousPokemons = List<PokemonEntity>.from(homeCubit.state.pokemons);

      final Matcher isSortedByNumber = isA<List<PokemonEntity>>().having(
        (pokemons) {
          for (var i = 0; i < pokemons.length - 1; i++) {
            if (pokemons[i].id > pokemons[i + 1].id) {
              return false;
            }
          }
          return true;
        },
        'Sorted by number in ascending order',
        true,
      );

      // Act
      homeCubit.sortPokemons(SortPokeBy.number);

      // Assert
      expect(homeCubit.pokemons, isSortedByNumber);
      expect(homeCubit.state.pokemons, allOf(isSortedByNumber, isNot(previousPokemons)));
    });

    test('should sort by name the pokemons parameter and emit a new state with the sorted pokemons',
        () async {
      // Arrange
      when(() => mockGetPokemonsUseCase.call(0))
          .thenAnswer((invocation) async => Result.success(pokemonsMock));
      await homeCubit.getPokemons(0);

      final previousPokemons = List<PokemonEntity>.from(homeCubit.state.pokemons);

      final Matcher isSortedByName = isA<List<PokemonEntity>>().having(
        (pokemons) {
          for (var i = 0; i < pokemons.length - 1; i++) {
            if (pokemons[i].name.compareTo(pokemons[i + 1].name) > 0) {
              return false;
            }
          }
          return true;
        },
        'Sorted by name in alphabetical order',
        true,
      );

      // Act
      homeCubit.sortPokemons(SortPokeBy.name);

      // Assert
      expect(homeCubit.pokemons, isSortedByName);
      expect(homeCubit.state.pokemons, allOf(isSortedByName, isNot(previousPokemons)));
    });
  });

  group('HomeCubit.searchPokemons |', () {
    test('should emit a new state with the pokemons that match the query', () async {
      // Arrange
      const query = 'CHAR';
      final pikachu = pokemonsMock[0];
      final charizard = pokemonsMock[1];
      final charmander = pokemonsMock[2];

      when(() => mockGetPokemonsUseCase.call(0))
          .thenAnswer((invocation) async => Result.success(pokemonsMock));
      await homeCubit.getPokemons(0);

      final previousPokemons = List<PokemonEntity>.from(homeCubit.state.pokemons);

      // Act
      homeCubit.searchPokemons(query);

      // Assert
      expect(
          homeCubit.state.pokemons,
          allOf(
            containsAll([charmander, charizard]),
            isNot(contains(pikachu)),
            isNot(previousPokemons),
          ));
      expect(homeCubit.state.searchText, equals(query));
    });
  });
}
