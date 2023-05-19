class PokemonRouteParamsDTO {
  final int id;
  final PokeDetailsTransitionType transitionType;
  PokemonRouteParamsDTO({
    required this.id,
    this.transitionType = PokeDetailsTransitionType.normal,
  });
}

enum PokeDetailsTransitionType {
  normal,
  toLeft,
  toRight,
}
