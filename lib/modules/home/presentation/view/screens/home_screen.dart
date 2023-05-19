import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../../core/di/service_locator_imp.dart';
import '../../../../../core/routes/route_names.dart';
import '../../cubits/home_cubit.dart';
import '../../cubits/home_state.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/pokemon_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.addPostFrameCallback}) : super(key: key);
  final VoidCallback? addPostFrameCallback;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeCubit = ServiceLocatorImp.I.get<HomeCubit>();

  @override
  void initState() {
    super.initState();

    _homeCubit.getPokemons(_homeCubit.page);
  }

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Theme.of(context).colorScheme.primary,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: BlocProvider(
              create: (_) => _homeCubit,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) => Padding(
                  padding: const EdgeInsets.all(4),
                  child: LayoutBuilder(
                    builder: (context, constraints) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 124,
                          child: AppBarWidget(
                            height: 124,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: constraints.maxHeight - 134,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, -2),
                                  blurRadius: 5,
                                  spreadRadius: 4,
                                  color:
                                      Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
                                  inset: true,
                                ),
                              ],
                            ),
                            child: LazyLoadScrollView(
                              onEndOfPage: _homeCubit.nextPage,
                              child: GridView.custom(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: 0.96296,
                                ),
                                childrenDelegate: SliverChildBuilderDelegate(
                                  childCount: state.isLoading
                                      ? state.pokemons.length + 1
                                      : state.pokemons.length,
                                  (context, index) =>
                                      state.isLoading && index == state.pokemons.length
                                          ? PokemonCardWidget.inLoading()
                                          : PokemonCardWidget(
                                              pokemon: state.pokemons[index],
                                              onTap: () => Navigator.pushNamed(
                                                context,
                                                RouteNames.details,
                                                arguments: state.pokemons[index].id,
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
      );
}
