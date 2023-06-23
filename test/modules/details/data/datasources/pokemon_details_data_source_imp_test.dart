import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_app/core/http/http_client.dart';
import 'package:poke_app/core/utils/api_paths.dart';
import 'package:poke_app/modules/details/data/datasources/imp/pokemon_details_data_source_imp.dart';
import 'package:poke_app/modules/details/domain/entities/pokemon_details_entity.dart';
import 'package:poke_app/shared/domain/entities/failure/failure.dart';
import 'package:poke_app/shared/domain/entities/response/response.dart';

import '../../../../fixtures/get_pokemon_details_fixture.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late PokemonDetailsDataSourceImp dataSource;
  late MockHttpClient mockHttpClient;
  const int pokemonId = 1;
  const String detailsPath = '${ApiPaths.details}/$pokemonId';

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = PokemonDetailsDataSourceImp(httpClient: mockHttpClient);
  });

  group('PokemonDetailsDataSource.getDetails |', () {
    test('success: should return a Result with a PokemonDetailsEntity', () async {
      // Arrange
      final response = getPokemonDetailsFixture;

      when(() => mockHttpClient.get(detailsPath)).thenAnswer((_) async => ResponseApp(
            data: response,
            statusCode: 200,
          ));

      // Act
      final result = await dataSource.getDetails(pokemonId);

      // Assert
      expect(result.isSuccess, isTrue);
      expect(result.data, isA<PokemonDetailsEntity>());

      verify(() => mockHttpClient.get(any())).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });

    test(
        'failure: should return a Result with a ServerFailure when the status code is not within the range 200-299',
        () async {
      // Arrange

      when(() => mockHttpClient.get(any())).thenAnswer((_) async => ResponseApp(
            statusCode: 500,
            statusMessage: 'Api error',
          ));

      // Act
      final result = await dataSource.getDetails(pokemonId);

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.error, const ServerFailure(message: 'Api error'));

      verify(() => mockHttpClient.get(any())).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });

    test('fallure: should return a Failure when a Failure occurs', () async {
      // Arrange
      const int pokemonId = 1;
      const String errorMessage = 'Error';

      when(() => mockHttpClient.get(any())).thenThrow(const Failure(errorMessage));

      // Act
      final result = await dataSource.getDetails(pokemonId);

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.error, isA<Failure>());

      verify(() => mockHttpClient.get(any())).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });

    test('fallure: should return a Failure when any error occurs', () async {
      // Arrange
      const int pokemonId = 1;
      const String errorMessage = 'Error';

      when(() => mockHttpClient.get(any())).thenThrow(Exception(errorMessage));

      // Act
      final result = await dataSource.getDetails(pokemonId);

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.error, isA<Failure>());

      verify(() => mockHttpClient.get(any())).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });
  });
}
