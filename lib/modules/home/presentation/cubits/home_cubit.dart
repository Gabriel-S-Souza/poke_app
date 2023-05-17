import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/pokemon_use_case.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetPokemonsUseCase _getPokemonsUseCase;
  HomeCubit(this._getPokemonsUseCase) : super(const HomeInitial());

  Future<void> getPokemon(int page) async {
    // emit(const HomeLoading());
    // final result = await _getPokemonsUseCase(page);
    // result.when(
    //   (error) => emit(HomeError(error)),
    //   (success) => emit(HomeSuccess(success)),
    // );
  }
}
