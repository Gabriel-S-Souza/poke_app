import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/pokemon_entity.dart';
import '../../domain/usecases/pokemon_use_case.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPokemonsUseCase _getPokemonsUseCase;
  HomeCubit({
    required GetPokemonsUseCase getPokemonsUseCase,
  })  : _getPokemonsUseCase = getPokemonsUseCase,
        super(const HomeState());

  int _page = 0;
  int get page => _page;

  final List<PokemonEntity> _pokemons = [];

  Future<void> getPokemons(int page) async {
    emit(state.startLoading());
    final result = await _getPokemonsUseCase(page);
    result.when(
      onSuccess: (pokemons) {
        _pokemons.addAll(pokemons);
        emit(HomeState(pokemons: _pokemons));
      },
      onFailure: (failure) => emit(state.error(failure.message)),
    );
  }

  void nextPage() {
    _page++;
    getPokemons(_page);
  }
}
