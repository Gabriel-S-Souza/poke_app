import 'package:equatable/equatable.dart';

import '../../domain/entities/pokemon_details_entity.dart';

abstract class PokemonDetailsState extends Equatable {
  const PokemonDetailsState();
}

class PokemonDetailsLoading extends PokemonDetailsState {
  const PokemonDetailsLoading();

  @override
  List<Object?> get props => [];
}

class PokemonDetailsInitial extends PokemonDetailsState {
  const PokemonDetailsInitial();

  @override
  List<Object?> get props => [];
}

class PokemonDetailsSuccess extends PokemonDetailsState {
  final PokemonDetailsEntity pokemonDetails;

  const PokemonDetailsSuccess(this.pokemonDetails);

  @override
  List<Object?> get props => [pokemonDetails];
}

class PokemonDetailsError extends PokemonDetailsState {
  final String message;

  const PokemonDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
