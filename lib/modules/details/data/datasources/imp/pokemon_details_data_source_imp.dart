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
      final responseDescription = await _httpClient.get('${ApiPaths.pokemonSpecies}/$pokemonId');

      if (response.isSuccess) {
        final String descriptionText;
        if (responseDescription.isSuccess) {
          final descriptionJson = responseDescription.data['flavor_text_entries']
              .firstWhere((element) => element['language']['name'] == 'en');
          descriptionText = descriptionJson['flavor_text'];
        } else {
          descriptionText =
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.';
        }
        final data = response.data..['description'] = _removeModifiers(descriptionText);
        return Result.success(PokemonDetailsModel.fromJson(data));
      } else {
        return Result.failure(const ServerFailure('Api error'));
      }
    } on Failure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnmappedFailure(e.toString()));
    }
  }

  /// Remove ```\n``` and ```\f``` from description text
  String _removeModifiers(String text) => text.replaceAll('\n', ' ').replaceAll('\f', '').trim();
}
