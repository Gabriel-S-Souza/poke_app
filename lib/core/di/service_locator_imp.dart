import 'package:get_it/get_it.dart';

import '../../modules/details/data/datasources/imp/pokemon_details_data_source_imp.dart';
import '../../modules/details/data/datasources/interface/pokemon_details_data_source.dart';
import '../../modules/details/data/repositories/pokemon_details_repository_imp.dart';
import '../../modules/details/domain/repositories/pokemon_details_repository.dart';
import '../../modules/details/domain/usecases/get_pokemon_details_use_case.dart';
import '../../modules/details/presentation/cubits/pokemon_details_cubit.dart';
import '../../modules/home/data/datasources/cache/imp/pokemon_data_source_cacheable_imp.dart';
import '../../modules/home/data/datasources/imp/pokemon_data_source_imp.dart';
import '../../modules/home/data/datasources/interface/pokemon_data_source.dart';
import '../../modules/home/data/repositories/pokemon_repository_imp.dart';
import '../../modules/home/domain/repositories/pokemon_repository_interface.dart';
import '../../modules/home/domain/usecases/pokemon_use_case.dart';
import '../../modules/home/presentation/cubits/home_cubit.dart';
import '../../shared/data/datasources/imp/local_storage_imp.dart';
import '../../shared/data/datasources/interface/local_storage.dart';
import '../http/dio_app.dart';
import '../http/http_client.dart';
import 'service_locator.dart';

class ServiceLocatorImp implements ServiceLocator {
  static final ServiceLocatorImp I = ServiceLocatorImp._internal();

  late final GetIt _getIt;

  ServiceLocatorImp._internal();

  factory ServiceLocatorImp([GetIt? getIt]) {
    I._getIt = getIt ?? GetIt.instance;
    return I;
  }

  @override
  Future<void> setupLocator() async {
    // http
    registerFactory<HttpClient>(() => HttpClient(dioApp));

    final localStorage = LocalStorageImp();
    await localStorage.init();

    // local storage
    registerFactory<LocalStorage>(() => localStorage);

    // data sources
    registerFactory<PokemonDataSource>(() => PokemonDataSourceCacheableImp(
          pokemonDataSource: PokemonDataSourceImp(httpClient: get()),
          localStorage: get(),
        ));

    registerFactory<PokemonDetailsDataSource>(() => PokemonDetailsDataSourceImp(httpClient: get()));

    // repositories
    registerFactory<PokemonRepository>(() => PokemonRepositoryImp(pokemonDataSource: get()));

    registerFactory<PokemonDetailsRepository>(
        () => PokemonDetailsRepositoryImp(pokemonDetailsDataSource: get()));

    // use cases
    registerFactory<GetPokemonsUseCase>(() => GetPokemonsUseCaseImp(pokemonRepository: get()));

    registerFactory<GetPokemonDetailsUseCase>(
        () => GetPokemonDetailsUseCaseImp(pokemonDetailsRepository: get()));

    // cubits
    registerFactory<HomeCubit>(() => HomeCubit(getPokemonsUseCase: get()));

    registerFactory<PokemonDetailsCubit>(
        () => PokemonDetailsCubit(getPokemonDetailsUseCase: get()));
  }

  @override
  T get<T extends Object>() => _getIt.get<T>();

  @override
  void registerFactory<T extends Object>(T Function() factory) {
    _getIt.registerFactory<T>(factory);
  }

  @override
  void registerSingleton<T extends Object>(T instance) {
    _getIt.registerSingleton<T>(instance);
  }

  @override
  bool isRegistered<T extends Object>() => _getIt.isRegistered<T>();
}
