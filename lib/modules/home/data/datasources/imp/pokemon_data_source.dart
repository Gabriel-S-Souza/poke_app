import '../../../../../core/http/http_client.dart';
import '../../../../../core/utils/api_paths.dart';
import '../../../../../shared/domain/entities/failure/failure.dart';
import '../../../../../shared/domain/entities/result/result.dart';
import '../../../domain/entities/pokemon_entity.dart';
import '../../models/pokemon_model.dart';
import '../interface/pokemon_data_source.dart';

class PokemonDataSourceImp implements PokemonDataSource {
  final HttpClient _httpClient;

  PokemonDataSourceImp({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<Result<List<PokemonEntity>>> getPokemons(int page) async {
    try {
      final response = await _httpClient.get('${ApiPaths.pokemon}?offset=${page * 20}&limit=20');

      if (response.isSuccess) {
        final pokemonsResponse = _addImageAndIdToResponse(response.data['results'], page);
        final pokemons = pokemonsResponse.map(PokemonModel.fromJson).toList();
        return Result.success(pokemons);
      } else {
        return const Result.failure(ServerFailure('Api error'));
      }
    } on Failure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnmappedFailure(e.toString()));
    }
  }

  List<Map<String, dynamic>> _addImageAndIdToResponse(List pokemons, int page) =>
      List.generate(pokemons.length, (index) {
        final int id = (index + 1) + (page * 20);
        return pokemons[index]
          ..addAll({
            'id': id,
            'imageUrl':
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
          });
      });
}
