enum PokeType {
  normal('normal'),
  fighting('fighting'),
  flying('flying'),
  poison('poison'),
  ground('ground'),
  rock('rock'),
  bug('bug'),
  ghost('ghost'),
  steel('steel'),
  fire('fire'),
  water('water'),
  grass('grass'),
  electric('electric'),
  psychic('psychic'),
  ice('ice'),
  dragon('dragon'),
  dark('dark'),
  fairy('fairy'),
  shadow('shadow'),
  unknown('unknown');

  final String value;

  const PokeType(this.value);
}
