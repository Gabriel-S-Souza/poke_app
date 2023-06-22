import 'package:flutter/material.dart';

import '../../../domain/entities/pokemon_entity.dart';
import 'pokemon_card_widget.dart';

class GridPokemonsWidget extends StatelessWidget {
  final bool isLoading;
  final List<PokemonEntity> pokemons;
  final void Function(PokemonEntity) onPokemonTap;

  const GridPokemonsWidget({
    super.key,
    this.pokemons = const <PokemonEntity>[],
    this.isLoading = false,
    required this.onPokemonTap,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return GridView.custom(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.96296,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: isLoading ? pokemons.length + 1 : pokemons.length,
        (context, index) => isLoading && index == pokemons.length
            ? PokemonCardWidget.inLoading()
            : PokemonCardWidget(
                pokemon: pokemons[index],
                onTap: () => onPokemonTap(
                  pokemons[index],
                ),
              ),
      ),
    );
  }
}
