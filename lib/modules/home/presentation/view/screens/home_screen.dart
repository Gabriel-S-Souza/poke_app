import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../../core/di/service_locator_imp.dart';
import '../../../../../core/routes/route_names.dart';
import '../../../../../shared/domain/entities/dto/pokemon_route_params_dto.dart';
import '../../../../../shared/presentation/view/widgets/box_content_widget.dart';
import '../../cubits/home_cubit.dart';
import '../../cubits/home_state.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/grid_pokemons_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.addPostFrameCallback}) : super(key: key);
  final VoidCallback? addPostFrameCallback;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeCubit = ServiceLocatorImp.I.get<HomeCubit>();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _homeCubit.getPokemons(_homeCubit.page);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  double get screenHeight => MediaQuery.sizeOf(context).height;
  double get bodyHeight => screenHeight - (124 + MediaQuery.of(context).padding.vertical + 8);
  Orientation get orientation => MediaQuery.orientationOf(context);

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Theme.of(context).colorScheme.primary,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Scaffold(
              body: BlocProvider(
                create: (_) => _homeCubit,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) => LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      physics: orientation == Orientation.portrait
                          ? const NeverScrollableScrollPhysics()
                          : const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            height: 124,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: AppBarWidget(
                              height: 124,
                              currentSortBy: state.sortBy,
                              searchController: _searchController,
                              onSort: (sortBy) {
                                _homeCubit.sortPokemons(sortBy);
                                if (_searchController.text.isNotEmpty) {
                                  _homeCubit.searchPokemons(_searchController.text);
                                }
                              },
                              onSearch: _homeCubit.searchPokemons,
                            ),
                          ),
                          SizedBox(
                            height: orientation == Orientation.portrait ? bodyHeight + 8 : null,
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: Container(
                                height: bodyHeight + 8,
                                padding: const EdgeInsets.all(4),
                                color: Theme.of(context).colorScheme.primary,
                                child: BoxContentWidget(
                                  height: constraints.maxHeight - 134,
                                  clipBehavior: Clip.antiAlias,
                                  child: LazyLoadScrollView(
                                    onEndOfPage: () {
                                      final bool canLoadNextPage = _searchController.text.isEmpty &&
                                          state.searchText.isEmpty &&
                                          !state.isLoading;

                                      if (canLoadNextPage) {
                                        _homeCubit.nextPage();
                                      }
                                    },
                                    child: GridPokemonsWidget(
                                      isLoading: state.isLoading,
                                      pokemons: state.pokemons,
                                      onPokemonTap: (pokemon) => Navigator.pushNamed(
                                        context,
                                        RouteNames.details,
                                        arguments: PokemonRouteParamsDTO(
                                          id: pokemon.id,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
