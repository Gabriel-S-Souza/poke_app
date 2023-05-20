import 'package:flutter/material.dart';

import '../../../../../core/utils/string_extension.dart';
import '../../../domain/entities/pokemon_entity.dart';

class PokemonCardWidget extends StatelessWidget {
  final PokemonEntity pokemon;
  final VoidCallback onTap;
  final bool isLoading;
  const PokemonCardWidget({
    super.key,
    required this.pokemon,
    required this.onTap,
    this.isLoading = false,
  });

  factory PokemonCardWidget.inLoading() => PokemonCardWidget(
        pokemon: PokemonEntity(
          id: 0,
          name: '',
          image: '',
        ),
        onTap: () {},
        isLoading: true,
      );

  String get pokeIdFormatted => '#${pokemon.id.toString().padLeft(3, '0')}';

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: isLoading ? null : onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    FractionallySizedBox(
                      heightFactor: 0.44,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onTertiary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Text(
                                        pokeIdFormatted,
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Transform.scale(
                                      scale: 1.05,
                                      child: Image.network(pokemon.image),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    pokemon.name.capitalize(),
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
