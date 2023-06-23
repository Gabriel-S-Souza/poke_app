import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/domain/entities/result/result.dart';
import '../../../../shared/presentation/toast/controller/toast_controller.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/usecases/pokemon_use_case.dart';
import '../view/widgets/radio_tile_widget.dart';
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

  @visibleForTesting
  List<PokemonEntity> get pokemons => _pokemons;

  Future<void> getPokemons(int page) async {
    emit(state.startLoading());
    final Result<List<PokemonEntity>> result = await _getPokemonsUseCase(page);

    result.when(
      onSuccess: (pokemons) {
        _pokemons.addAll(pokemons);
        if (state.sortBy != SortPokeBy.number) {
          sortPokemons(state.sortBy, updateState: false);
        }
        emit(state.copyWith(
          pokemons: _pokemons,
          isLoading: false,
        ));
      },
      onFailure: (failure) {
        Toast.show(failure.message);
        _pokemons.clear();
        _pokemons.addAll(failure.cachedData ?? []);
        emit(state.copyWith(
          pokemons: failure.cachedData ?? [],
          isLoading: false,
          messageError: failure.message,
        ));
      },
    );
  }

  Future<void> nextPage() async {
    _page++;
    await getPokemons(_page);
    if (state.hasError) {
      _page--;
    }
  }

  void sortPokemons(SortPokeBy sort, {bool updateState = true}) {
    _pokemons.sort(
      (a, b) {
        switch (sort) {
          case SortPokeBy.number:
            return a.id.compareTo(b.id);
          case SortPokeBy.name:
            return a.name.compareTo(b.name);
        }
      },
    );

    if (updateState) {
      emit(state.copyWith(
        pokemons: _pokemons,
        sortBy: sort,
      ));
    }
  }

  void searchPokemons(String query) {
    final pokemons = _pokemons.where((element) {
      final name = element.name.toLowerCase();
      final number = '#${element.id.toString().padLeft(3, '0')}';
      final lowerQuery = query.toLowerCase();
      return name.contains(lowerQuery) || number.contains(lowerQuery);
    }).toList();

    emit(state.copyWith(
      pokemons: pokemons,
      searchText: query,
    ));
  }
}
