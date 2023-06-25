import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_app/modules/home/data/datasources/remote/interface/pokemon_data_source.dart';
import 'package:poke_app/modules/home/data/repositories/pokemon_repository_imp.dart';
import 'package:poke_app/modules/home/domain/entities/pokemon_entity.dart';
import 'package:poke_app/shared/domain/entities/failure/failure.dart';
import 'package:poke_app/shared/domain/entities/result/result.dart';

import '../../../../mocks/pokemons_mock.dart';

class MockPokemonDataSource extends Mock implements PokemonDataSource {}

void main() {
  late PokemonRepositoryImp repository;
  late MockPokemonDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockPokemonDataSource();
    repository = PokemonRepositoryImp(pokemonDataSource: mockDataSource);
  });

  group('PokemonRepositoryImp.getPokemons |', () {
    test('success: should return a Result with a list of PokemonEntity', () async {
      // Arrange
      final List<PokemonEntity> pokemons = pokemonsMock;

      when(() => mockDataSource.getPokemons(any()))
          .thenAnswer((invocation) async => Result.success(pokemons));

      // Act
      final result = await repository.getPokemons(0);

      // Assert
      expect(result.isSuccess, isTrue);
      expect(result.data, isA<List<PokemonEntity>>());

      verify(() => mockDataSource.getPokemons(0)).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        'failure: should return a Result with a Failure when the data source response is unsuccessful',
        () async {
      // Arrange
      const failure = Failure('Failed to fetch Pokemons');
      when(() => mockDataSource.getPokemons(any()))
          .thenAnswer((invocation) async => Result.failure(failure));

      // Act
      final result = await repository.getPokemons(0);

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.failure, isA<Failure>());

      verify(() => mockDataSource.getPokemons(0)).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
