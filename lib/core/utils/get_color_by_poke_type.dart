import 'package:flutter/material.dart';

import '../../modules/details/domain/entities/poke_type.dart';
import '../theme/theme.dart';

Color getColorByPokeType(PokeType type) {
  switch (type) {
    case PokeType.bug:
      return AppColors.bug;
    case PokeType.dark:
      return AppColors.dark;
    case PokeType.dragon:
      return AppColors.dragon;
    case PokeType.electric:
      return AppColors.electric;
    case PokeType.fairy:
      return AppColors.fairy;
    case PokeType.fighting:
      return AppColors.fighting;
    case PokeType.fire:
      return AppColors.fire;
    case PokeType.flying:
      return AppColors.flying;
    case PokeType.ghost:
      return AppColors.ghost;
    case PokeType.grass:
      return AppColors.grass;
    case PokeType.ground:
      return AppColors.ground;
    case PokeType.ice:
      return AppColors.ice;
    case PokeType.normal:
      return AppColors.normal;
    case PokeType.poison:
      return AppColors.poison;
    case PokeType.psychic:
      return AppColors.psychic;
    case PokeType.rock:
      return AppColors.rock;
    case PokeType.steel:
      return AppColors.steel;
    case PokeType.water:
      return AppColors.water;
    default:
      return AppColors.normal;
  }
}
