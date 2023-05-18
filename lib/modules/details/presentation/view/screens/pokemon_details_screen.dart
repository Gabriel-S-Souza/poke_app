import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/service_locator_imp.dart';
import '../../cubits/pokemon_details_cubit.dart';
import '../../cubits/pokemon_details_state.dart';

class PokemonDetailsScreen extends StatefulWidget {
  final int pokemonId;
  const PokemonDetailsScreen({
    super.key,
    required this.pokemonId,
  });

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  final _pokemonDetailsCubit = ServiceLocatorImp.I.get<PokemonDetailsCubit>();

  @override
  void initState() {
    super.initState();

    _pokemonDetailsCubit.getDetails(widget.pokemonId);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pokemon Details',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: BlocProvider(
          create: (_) => _pokemonDetailsCubit,
          child: BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
            builder: (context, state) {
              if (state is PokemonDetailsLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              } else if (state is PokemonDetailsSuccess) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(state.pokemonDetails.name),
                    Text(state.pokemonDetails.id.toString()),
                    Text(state.pokemonDetails.image.toString()),
                    Text(state.pokemonDetails.abilities.toString()),
                    Text(state.pokemonDetails.types.toString()),
                    Text(state.pokemonDetails.moves.toString()),
                  ],
                );
              } else if (state is PokemonDetailsError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: Text('Pokemon Details'),
                );
              }
            },
          ),
        ),
      );
}
