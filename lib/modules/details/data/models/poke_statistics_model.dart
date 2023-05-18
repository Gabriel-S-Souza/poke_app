import '../../domain/entities/poke_statistics_entity.dart';

class PokeStatisticModel extends PokeStatisticEntity {
  PokeStatisticModel({
    required super.name,
    required super.value,
  });

  factory PokeStatisticModel.fromJson(Map<String, dynamic> json) => PokeStatisticModel(
        name: json['stat']['name'],
        value: json['base_stat'],
      );
}
