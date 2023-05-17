import '../../../../../core/http/http_client.dart';
import '../../../../../shared/domain/entities/result/result.dart';
import '../interface/pokemon_data_source.dart';

class PokemonDataSourceImp implements PokemonDataSource {
  final HttpClient _httpClient;

  PokemonDataSourceImp({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<Result> getPokemons(int page) {
    // TODO: implement getPokemons
    throw UnimplementedError();
  }
}
