import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../core/di/service_locator_imp.dart';
import '../cubits/home_cubit.dart';
import '../cubits/home_state.dart';

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

    _homeCubit.getPokemon(_homeCubit.page);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider(
          create: (_) => _homeCubit,
          child: BlocProvider(
            create: (_) => _homeCubit,
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeInitialLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeError) {
                  return Center(
                    child: Text(state.messageError ?? 'Error'),
                  );
                } else {
                  return LazyLoadScrollView(
                    onEndOfPage: _homeCubit.nextPage,
                    child: ListView.builder(
                      itemCount:
                          state.isLoading ? state.pokemons.length + 1 : state.pokemons.length,
                      itemBuilder: (context, index) =>
                          state.isLoading && index == state.pokemons.length
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListTile(
                                  onTap: () {
                                    debugPrint('id: ${state.pokemons[index].id}');
                                  },
                                  title: Text(
                                    state.pokemons[index].name,
                                  ),
                                  subtitle: Text(
                                    'id: ${state.pokemons[index].id}',
                                  ),
                                  leading: Image.network(
                                    state.pokemons[index].image,
                                  ),
                                ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      );
}
