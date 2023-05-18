import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/service_locator_imp.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/string_extension.dart';
import '../../../domain/entities/poke_type.dart';
import '../../cubits/pokemon_details_cubit.dart';
import '../../cubits/pokemon_details_state.dart';
import '../widgets/header_screen_widget.dart';
import '../widgets/poke_statistics_widget.dart';

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

  double _getBodyPaddingTop(BoxConstraints constraints) =>
      constraints.maxHeight * 0.092 - MediaQuery.of(context).padding.vertical + 8;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => _pokemonDetailsCubit,
        child: BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
          builder: (context, state) => SafeArea(
            child: Scaffold(
              backgroundColor: state is PokemonDetailsSuccess
                  ? _getColorByPokeType(state.pokemonDetails.types.first)
                  : Colors.white,
              body: LayoutBuilder(
                builder: (context, constraints) => Padding(
                  padding: const EdgeInsets.all(4),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * 0.32 -
                                MediaQuery.of(context).padding.vertical,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Positioned(
                                  right: 9.05,
                                  child: SizedBox(
                                    height: constraints.maxHeight * 0.32 -
                                        MediaQuery.of(context).padding.vertical,
                                    child: Image.asset(
                                      Assets.pokeballImg,
                                      fit: BoxFit.fitHeight,
                                      color: AppColors.white.withOpacity(0.1),
                                    ),
                                  ),
                                ),
                                HeaderScreenWidget(
                                  title: state is PokemonDetailsSuccess
                                      ? state.pokemonDetails.name.capitalize()
                                      : 'Pokemon Details',
                                  pokeId:
                                      state is PokemonDetailsSuccess ? state.pokemonDetails.id : 0,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.66 -
                                MediaQuery.of(context).padding.vertical,
                            child: Container(
                              padding: const EdgeInsets.all(16).copyWith(
                                top: _getBodyPaddingTop(constraints),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Builder(
                                builder: (context) {
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
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: state.pokemonDetails.types
                                              .map(
                                                (type) => Container(
                                                  margin: const EdgeInsets.only(right: 16),
                                                  padding: const EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 8,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: _getColorByPokeType(type),
                                                    borderRadius: BorderRadius.circular(16),
                                                  ),
                                                  child: Text(
                                                      type.toString().split('.').last.capitalize()),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                        Text(
                                          'About',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: _getColorByPokeType(
                                                  state.pokemonDetails.types.first)),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  '${state.pokemonDetails.height.toStringAsFixed(1)} m',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Text(
                                                  'Height',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: const EdgeInsets.symmetric(horizontal: 16),
                                              height: 24,
                                              width: 1,
                                              color: Colors.grey,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  '${state.pokemonDetails.weight.toStringAsFixed(1)} kg',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Text(
                                                  'Weight',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: const EdgeInsets.symmetric(horizontal: 16),
                                              height: 24,
                                              width: 1,
                                              color: Colors.grey,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  state.pokemonDetails.abilities
                                                      .map((ability) => ability.capitalize())
                                                      .join('\n'),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Text(
                                                  'Moves',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          state.pokemonDetails.description,
                                        ),
                                        Text(
                                          'Base Stats',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: _getColorByPokeType(
                                                state.pokemonDetails.types.first),
                                          ),
                                        ),
                                        PokeStatisticsWidget(
                                            statistics: state.pokemonDetails.statistics),
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
                          ),
                        ],
                      ),
                      Positioned(
                        top:
                            constraints.maxHeight * 0.092 - MediaQuery.of(context).padding.vertical,
                        child: SizedBox(
                          height: constraints.maxHeight * 0.33 -
                              MediaQuery.of(context).padding.vertical,
                          child: state is PokemonDetailsSuccess
                              ? Image.network(
                                  state.pokemonDetails.image,
                                  fit: BoxFit.fitHeight,
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Color _getColorByPokeType(PokeType type) {
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
}
