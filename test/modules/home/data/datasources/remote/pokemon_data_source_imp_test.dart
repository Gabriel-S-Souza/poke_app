import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_app/core/http/http_client.dart';
import 'package:poke_app/modules/home/data/datasources/remote/imp/pokemon_data_source_imp.dart';
import 'package:poke_app/modules/home/domain/entities/pokemon_entity.dart';
import 'package:poke_app/shared/domain/entities/failure/failure.dart';
import 'package:poke_app/shared/domain/entities/response/response.dart';

import '../../../../../fixtures/get_pokemons_fixture.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late PokemonDataSourceImp dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = PokemonDataSourceImp(httpClient: mockHttpClient);
  });

  group('PokemonDataSource.getPokemons |', () {
    test('success: should return a Result with a list of PokemonEntity', () async {
      // Arrange
      const int page = 1;
      final response = getPokemonsFixture;

      when(() => mockHttpClient.get(any())).thenAnswer((_) async => ResponseApp(
            data: response,
            statusCode: 200,
          ));

      // Act
      final result = await dataSource.getPokemons(page);

      // Assert
      expect(result.isSuccess, isTrue);
      expect(result.data, isA<List<PokemonEntity>>());

      verify(() => mockHttpClient.get(any())).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });

    test(
        'failure: should return a Result with a ServerFailure when the status code is not within the range 200-299',
        () async {
      // Arrange
      const int page = 1;

      when(() => mockHttpClient.get(any())).thenAnswer((_) async => ResponseApp(
            statusCode: 500,
            statusMessage: 'Api error',
          ));

      // Act
      final result = await dataSource.getPokemons(page);

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.failure, isA<ServerFailure>());

      verify(() => mockHttpClient.get(any())).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });

    test('failure: should return a Result with a Failure when any error occurs', () async {
      // Arrange
      const int page = 1;
      const String errorMessage = 'Error';

      when(() => mockHttpClient.get(any())).thenThrow(errorMessage);

      // Act
      final result = await dataSource.getPokemons(page);

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.failure, isA<Failure>());

      verify(() => mockHttpClient.get(any())).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });
  });
}
