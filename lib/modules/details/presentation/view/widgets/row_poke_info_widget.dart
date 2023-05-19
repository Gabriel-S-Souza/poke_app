import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/string_extension.dart';
import '../../../domain/entities/pokemon_details_entity.dart';

class RowPokeInfoWidget extends StatelessWidget {
  final PokemonDetailsEntity pokemonDetails;
  const RowPokeInfoWidget({super.key, required this.pokemonDetails});

  String get movePokeText =>
      pokemonDetails.abilities.take(2).map((move) => move.capitalize()).join('\n');

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.weight,
                          height: 14,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${pokemonDetails.weight.toStringAsFixed(1)} kg',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                letterSpacing: 0.5,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Weight',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 48,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.ruler,
                          height: 14,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${pokemonDetails.height.toStringAsFixed(1)} m',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                letterSpacing: 0.5,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Height',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 48,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      movePokeText,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            letterSpacing: 0.5,
                          ),
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Moves',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
