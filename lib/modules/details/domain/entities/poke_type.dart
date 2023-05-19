enum PokeType {
  normal('normal', hexColor: 0xFFAAA67F),
  fighting('fighting', hexColor: 0xFFC12239),
  flying('flying', hexColor: 0xFFA891EC),
  poison('poison', hexColor: 0xFFA43E9E),
  ground('ground', hexColor: 0xFFDEC16B),
  rock('rock', hexColor: 0xFFB69E31),
  bug('bug', hexColor: 0xFFA7B723),
  ghost('ghost', hexColor: 0xFF70559B),
  steel('steel', hexColor: 0xFFB7B9D0),
  fire('fire', hexColor: 0xFFF57D31),
  water('water', hexColor: 0xFF6493EB),
  grass('grass', hexColor: 0xFF74CB48),
  electric('electric', hexColor: 0xFFF9CF30),
  psychic('psychic', hexColor: 0xFFFB5584),
  ice('ice', hexColor: 0xFF9AD6DF),
  dragon('dragon', hexColor: 0xFF7037FF),
  dark('dark', hexColor: 0xFF75574C),
  fairy('fairy', hexColor: 0xFFE69EAC),
  shadow('shadow', hexColor: 0xFFFFFFFF),
  unknown('unknown', hexColor: 0xFFFFFFFF);

  final String value;
  final int hexColor;

  const PokeType(this.value, {required this.hexColor});
}
