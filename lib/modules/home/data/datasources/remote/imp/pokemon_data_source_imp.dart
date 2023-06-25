import '../../../../../../core/http/http_client.dart';
import '../../../../../../core/utils/api_paths.dart';
import '../../../../../../shared/domain/entities/failure/failure.dart';
import '../../../../../../shared/domain/entities/result/result.dart';
import '../../../../domain/entities/pokemon_entity.dart';
import '../../../models/pokemon_model.dart';
import '../interface/pokemon_data_source.dart';

class PokemonDataSourceImp implements PokemonDataSource {
  final HttpClient _httpClient;

  PokemonDataSourceImp({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<Result<List<PokemonEntity>>> getPokemons(int page) async {
    try {
      final response = await _httpClient.get('${ApiPaths.pokemon}?page=$page');

      if (response.isSuccess) {
        final pokemons =
            (response.data['results'] as List).map((e) => PokemonModel.fromJson(e)).toList();
        return Result.success(pokemons);
      } else {
        return Result.failure(const ServerFailure());
      }
    } on Failure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnmappedFailure(e.toString()));
    }
  }
}
