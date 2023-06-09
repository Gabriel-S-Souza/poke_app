import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/service_locator_imp.dart';
import '../../../../../core/routes/route_names.dart';
import '../../../../../core/utils/string_extension.dart';
import '../../../../../shared/domain/entities/dto/pokemon_route_params_dto.dart';
import '../../../../../shared/presentation/view/widgets/box_content_widget.dart';
import '../../cubits/pokemon_details_cubit.dart';
import '../../cubits/pokemon_details_state.dart';
import '../widgets/header_screen_widget.dart';
import '../widgets/poke_ball_positioned_widget.dart';
import '../widgets/poke_floating_image_widget.dart';
import '../widgets/poke_statistics_widget.dart';
import '../widgets/row_poke_info_widget.dart';
import '../widgets/type_tags_widget.dart';

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

  Orientation get orientation => MediaQuery.orientationOf(context);
  double get screenHeight => orientation == Orientation.portrait
      ? MediaQuery.sizeOf(context).height
      : MediaQuery.sizeOf(context).width;

  double get verticalPadding => MediaQuery.paddingOf(context).vertical;

  double get bodyPaddingTop =>
      (screenHeight - verticalPadding) * 0.092 - MediaQuery.paddingOf(context).vertical + 8;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => _pokemonDetailsCubit,
        child: BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
          builder: (context, state) => SafeArea(
            child: Scaffold(
              backgroundColor: state is PokemonDetailsSuccess
                  ? Color(state.pokemonDetails.types.first.hexColor)
                  : Theme.of(context).colorScheme.onSecondary,
              body: SingleChildScrollView(
                physics: orientation == Orientation.portrait
                    ? const NeverScrollableScrollPhysics()
                    : null,
                child: SizedBox(
                  height: screenHeight - verticalPadding,
                  child: LayoutBuilder(
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
                                    PokeBallPositionedWidget(
                                      constraints: constraints,
                                      right: 9.05,
                                    ),
                                    HeaderScreenWidget(
                                      title: state is PokemonDetailsSuccess
                                          ? state.pokemonDetails.name.capitalize()
                                          : '',
                                      pokeId: state is PokemonDetailsSuccess
                                          ? state.pokemonDetails.id
                                          : null,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: constraints.maxHeight * 0.66 -
                                    MediaQuery.of(context).padding.vertical,
                                child: BoxContentWidget(
                                  padding: const EdgeInsets.all(20).copyWith(top: bodyPaddingTop),
                                  child: Builder(
                                    builder: (context) {
                                      if (state is PokemonDetailsLoading) {
                                        return orientation == Orientation.portrait
                                            ? const Center(
                                                child: CircularProgressIndicator(),
                                              )
                                            : const Center(
                                                child: Text('Carregando...'),
                                              );
                                      } else if (state is PokemonDetailsSuccess) {
                                        return Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            TypeTagsWidget(
                                              types: state.pokemonDetails.types,
                                            ),
                                            Text(
                                              'About',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                    color: Color(
                                                        state.pokemonDetails.types.first.hexColor),
                                                  ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8),
                                              child: RowPokeInfoWidget(
                                                pokemonDetails: state.pokemonDetails,
                                              ),
                                            ),
                                            Text(
                                              state.pokemonDetails.description,
                                              style: Theme.of(context).textTheme.labelSmall,
                                              textAlign: TextAlign.justify,
                                            ),
                                            Text(
                                              'Base Stats',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                    color: Color(
                                                        state.pokemonDetails.types.first.hexColor),
                                                  ),
                                            ),
                                            PokeStatisticsWidget(
                                              statistics: state.pokemonDetails.statistics,
                                              valueBarColor:
                                                  Color(state.pokemonDetails.types.first.hexColor),
                                            ),
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
                          PokeFloatingImageWidget(
                            constraints: constraints,
                            isLoading: state is PokemonDetailsLoading,
                            pokemonId: state is PokemonDetailsSuccess ? state.pokemonDetails.id : 0,
                            imageUrl:
                                state is PokemonDetailsSuccess ? state.pokemonDetails.image : null,
                            onLeftPressed: () {
                              if (widget.pokemonId == 1) return;

                              Navigator.pushReplacementNamed(
                                context,
                                RouteNames.details,
                                arguments: PokemonRouteParamsDTO(
                                  id: widget.pokemonId - 1,
                                  transitionType: PokeDetailsTransitionType.toLeft,
                                ),
                              );
                            },
                            onRightPressed: () {
                              if (widget.pokemonId == 1281) return;

                              Navigator.pushReplacementNamed(
                                context,
                                RouteNames.details,
                                arguments: PokemonRouteParamsDTO(
                                  id: widget.pokemonId + 1,
                                  transitionType: PokeDetailsTransitionType.toRight,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
