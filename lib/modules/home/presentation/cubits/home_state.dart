import 'package:equatable/equatable.dart';

import '../../domain/entities/pokemon_entity.dart';

class HomeState extends Equatable {
  final List<PokemonEntity> pokemons;
  final String? messageError;
  final bool isLoading;
  const HomeState({
    this.pokemons = const [],
    this.isLoading = false,
    this.messageError,
  });

  HomeState copyWith({
    List<PokemonEntity>? pokemons,
    bool? isLoading,
    String? messageError,
  }) =>
      HomeState(
        pokemons: pokemons ?? this.pokemons,
        isLoading: isLoading ?? this.isLoading,
        messageError: messageError,
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
      ];
}

class HomeError extends HomeState {
  const HomeError({
    required super.messageError,
  });
}
