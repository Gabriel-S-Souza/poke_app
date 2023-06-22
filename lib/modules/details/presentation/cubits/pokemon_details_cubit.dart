import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/presentation/toast/controller/toast_controller.dart';
import '../../domain/usecases/get_pokemon_details_use_case.dart';
import 'pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  final GetPokemonDetailsUseCase _getPokemonDetailsUseCase;
  PokemonDetailsCubit({
    required GetPokemonDetailsUseCase getPokemonDetailsUseCase,
  })  : _getPokemonDetailsUseCase = getPokemonDetailsUseCase,
        super(const PokemonDetailsInitial());

  Future<void> getDetails(int pokemonId) async {
    emit(const PokemonDetailsLoading());
    final result = await _getPokemonDetailsUseCase(pokemonId);
    result.when(
      onSuccess: (details) => emit(PokemonDetailsSuccess(details)),
      onFailure: (failure) {
        Toast.show(failure.message);
        emit(PokemonDetailsError(failure.message));
      },
    );
  }
}
