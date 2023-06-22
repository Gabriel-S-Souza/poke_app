import 'package:equatable/equatable.dart';

import '../../domain/entities/pokemon_entity.dart';
import '../view/widgets/radio_tile_widget.dart';

class HomeState extends Equatable {
  final List<PokemonEntity> pokemons;
  final String? messageError;
  final bool isLoading;
  final String searching;
  final SortPokeBy sortBy;
  const HomeState({
    this.pokemons = const [],
    this.isLoading = false,
    this.messageError,
    this.sortBy = SortPokeBy.number,
    this.searching = '',
  });

  HomeState copyWith({
    List<PokemonEntity>? pokemons,
    bool? isLoading,
    String? messageError,
    SortPokeBy? sortBy,
    String? searching,
  }) =>
      HomeState(
        pokemons: pokemons ?? this.pokemons,
        isLoading: isLoading ?? this.isLoading,
        messageError: messageError,
        sortBy: sortBy ?? this.sortBy,
        searching: searching ?? this.searching,
      );

  HomeState startLoading() => copyWith(isLoading: true);

  HomeState stopLoading() => copyWith(isLoading: false);

  HomeState error(String message) => copyWith(messageError: message, isLoading: false);

  bool get hasError => messageError != null;

  @override
  List<Object?> get props => [
        pokemons,
        isLoading,
        messageError,
        sortBy,
      ];
}

class HomeError extends HomeState {
  const HomeError({
    required super.messageError,
  });
}
