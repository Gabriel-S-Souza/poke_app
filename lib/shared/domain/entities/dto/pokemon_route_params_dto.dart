class PokemonRouteParamsDTO {
  final int id;
  final TransitionType transitionType;
  PokemonRouteParamsDTO({
    required this.id,
    this.transitionType = TransitionType.normal,
  });
}

enum TransitionType {
  normal,
  toLeft,
  toRight,
}
