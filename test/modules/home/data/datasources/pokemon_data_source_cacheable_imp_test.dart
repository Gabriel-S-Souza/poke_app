import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_app/modules/home/data/datasources/cache/imp/pokemon_data_source_cacheable_imp.dart';
import 'package:poke_app/modules/home/data/datasources/cache/interface/pokemons_data_source_cacheable.dart';
import 'package:poke_app/modules/home/data/models/pokemon_model.dart';
import 'package:poke_app/modules/home/domain/entities/pokemon_entity.dart';
import 'package:poke_app/shared/data/datasources/interface/local_storage.dart';
import 'package:poke_app/shared/domain/entities/failure/failure.dart';
import 'package:poke_app/shared/domain/entities/result/result.dart';

import '../../../../mocks/pokemons_mock.dart';

class MockLocalStorage extends Mock implements LocalStorage {}

class MockPokemonDataSource extends Mock implements PokemonDataSourceCacheable {}

void main() {
  late PokemonDataSourceCacheable dataSource;
  late MockLocalStorage mockLocalStorage;
  late MockPokemonDataSource mockPokemonDataSource;

  setUp(() {
    mockLocalStorage = MockLocalStorage();
    mockPokemonDataSource = MockPokemonDataSource();
    dataSource = PokemonDataSourceCacheableImp(
      pokemonDataSource: mockPokemonDataSource,
      localStorage: mockLocalStorage,
    );
  });

  group('PokemonDataSourceCacheable.getPokemons |', () {
    test(
        'success: should return a Result with a list of PokemonEntity and then call LocalStorage.setList to save it in cache',
        () async {
      // Arrange
      const int page = 1;

      when(() => mockPokemonDataSource.getPokemons(page))
          .thenAnswer((_) async => Result.success(pokemonsMock));
      when(() => mockLocalStorage.setList(
          key: any(named: 'key'),
          value: any(named: 'value', that: isA<List<String>>()))).thenAnswer((_) async => true);

      // Act
      final result = await dataSource.getPokemons(page);

      // Assert
      expect(result.isSuccess, isTrue);
      expect(result.data, isA<List<PokemonEntity>>());

      verify(() => mockPokemonDataSource.getPokemons(page)).called(1);
      verify(() => mockLocalStorage.setList(
          key: any(named: 'key'), value: any(named: 'value', that: isA<List<String>>()))).called(1);
      verifyNoMoreInteractions(mockPokemonDataSource);
      verifyNoMoreInteractions(mockLocalStorage);
    });

    test(
        'failure: should return a Result with a OfflineFailure having cached data if any, when offline',
        () async {
      // Arrange
      const int page = 1;
      final pokemonsForCache = pokemonsMock;
      const failure = OfflineFailure();

      when(() => mockPokemonDataSource.getPokemons(page))
          .thenAnswer((_) async => Result.failure(failure));
      when(() => mockLocalStorage.getList(any())).thenReturn([
        jsonEncode(PokemonModel.fromEntity(pokemonsForCache[0]).toJson()),
        jsonEncode(PokemonModel.fromEntity(pokemonsForCache[1]).toJson()),
      ]);

      // Act
      final result = await dataSource.getPokemons(page);

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.error, isA<Failure<List<PokemonEntity>>>());
      expect(result.error.cachedData, isA<List<PokemonEntity>>());

      verify(() => mockPokemonDataSource.getPokemons(page)).called(1);
      verify(() => mockLocalStorage.getList(any())).called(1);
      verifyNoMoreInteractions(mockPokemonDataSource);
      verifyNoMoreInteractions(mockLocalStorage);
    });

    test(
        'failure: should return a Result with a Failure and cached data if any, when an error occurs',
        () async {
      // Arrange
      const int page = 1;
      const failure = ServerFailure(message: 'Api error');

      when(() => mockPokemonDataSource.getPokemons(page))
          .thenAnswer((_) async => Result.failure(failure));
      when(() => mockLocalStorage.getList(any())).thenReturn([]);

      // Act
      final result = await dataSource.getPokemons(page);

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.error, isA<Failure>());
      expect(result.error.cachedData, isA<List<PokemonEntity>>());

      verify(() => mockPokemonDataSource.getPokemons(page)).called(1);
      verify(() => mockLocalStorage.getList(any())).called(1);
      verifyNoMoreInteractions(mockPokemonDataSource);
      verifyNoMoreInteractions(mockLocalStorage);
    });
  });
}
