import '../../../../../core/http/http_client.dart';
import '../../../../../core/utils/api_paths.dart';
import '../../../../../shared/domain/entities/failure/failure.dart';
import '../../../../../shared/domain/entities/result/result.dart';
import '../../../domain/entities/pokemon_details_entity.dart';
import '../../models/pokemon_details_model.dart';
import '../interface/pokemon_details_data_source.dart';

class PokemonDetailsDataSourceImp implements PokemonDetailsDataSource {
  final HttpClient _httpClient;

  PokemonDetailsDataSourceImp({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<Result<PokemonDetailsEntity>> getDetails(int pokemonId) async {
    try {
      final response = await _httpClient.get('${ApiPaths.pokemon}/$pokemonId');

      if (response.isSuccess) {
        return Result.success(PokemonDetailsModel.fromJson(response.data));
      } else {
        return Result.failure(const ServerFailure('Api error'));
      }
    } on Failure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnmappedFailure(e.toString()));
    }
  }
}
