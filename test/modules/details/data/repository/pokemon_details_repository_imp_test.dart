import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_app/modules/details/data/datasources/interface/pokemon_details_data_source.dart';
import 'package:poke_app/modules/details/data/repositories/pokemon_details_repository_imp.dart';
import 'package:poke_app/modules/details/domain/entities/pokemon_details_entity.dart';
import 'package:poke_app/shared/domain/entities/failure/failure.dart';
import 'package:poke_app/shared/domain/entities/result/result.dart';

import '../../../../mocks/pokemon_details_mock.dart';

class MockPokemonDetailsDataSource extends Mock implements PokemonDetailsDataSource {}

void main() {
  late PokemonDetailsRepositoryImp repository;
  late MockPokemonDetailsDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockPokemonDetailsDataSource();
    repository = PokemonDetailsRepositoryImp(pokemonDetailsDataSource: mockDataSource);
  });

  group('PokemonDetailsRepositoryImp.getDetails |', () {
    test('should return a Result with a PokemonDetailsEntity', () async {
      // Arrange
      final PokemonDetailsEntity pokemonDetails = pokemonDetailsMock;

      when(() => mockDataSource.getDetails(any()))
          .thenAnswer((invocation) async => Result.success(pokemonDetails));

      // Act
      final result = await repository.getDetails(0);

      // Assert
      expect(result.isSuccess, isTrue);
      expect(result.data, isA<PokemonDetailsEntity>());

      verify(() => mockDataSource.getDetails(0)).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return a Result with a Failure when the data source response is unsuccessful',
        () async {
      // Arrange
      const failure = Failure('Failed to fetch Pokemon Details');

      when(() => mockDataSource.getDetails(any()))
          .thenAnswer((invocation) async => Result.failure(failure));

      // Act
      final result = await repository.getDetails(0);

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.error, isA<Failure>());

      verify(() => mockDataSource.getDetails(0)).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
