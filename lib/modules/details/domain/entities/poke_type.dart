enum PokeType {
  normal('normal', 0xFFAAA67F),
  fighting('fighting', 0xFFC12239),
  flying('flying', 0xFFA891EC),
  poison('poison', 0xFFA43E9E),
  ground('ground', 0xFFDEC16B),
  rock('rock', 0xFFB69E31),
  bug('bug', 0xFFA7B723),
  ghost('ghost', 0xFF70559B),
  steel('steel', 0xFFB7B9D0),
  fire('fire', 0xFFF57D31),
  water('water', 0xFF6493EB),
  grass('grass', 0xFF74CB48),
  electric('electric', 0xFFF9CF30),
  psychic('psychic', 0xFFFB5584),
  ice('ice', 0xFF9AD6DF),
  dragon('dragon', 0xFF7037FF),
  dark('dark', 0xFF75574C),
  fairy('fairy', 0xFFE69EAC),
  shadow('shadow', 0xFFFFFFFF),
  unknown('unknown', 0xFFFFFFFF);

  final String value;
  final int hexColor;

  const PokeType(this.value, this.hexColor);
}
