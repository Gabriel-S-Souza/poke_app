import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:poke_app/core/di/service_locator_imp.dart';
import 'package:poke_app/core/utils/assets.dart';
import 'package:poke_app/modules/home/domain/usecases/pokemon_use_case.dart';
import 'package:poke_app/modules/home/presentation/cubits/home_cubit.dart';
import 'package:poke_app/modules/home/presentation/view/screens/home_screen.dart';
import 'package:poke_app/modules/home/presentation/view/widgets/app_bar_widget.dart';
import 'package:poke_app/modules/home/presentation/view/widgets/pokemon_card_widget.dart';
import 'package:poke_app/shared/domain/entities/result/result.dart';

import '../../../../../mocks/pokemons_mock_by_page.dart';
import '../../../../../setup/make_app_widget.dart';

class MockGetPokemonsUseCase extends Mock implements GetPokemonsUseCaseImp {}

void main() {
  late MaterialApp appWidget;
  late MockGetPokemonsUseCase mockGetPokemonsUseCase;
  late HomeCubit homeCubit;

  setUp(() {
    mockGetPokemonsUseCase = MockGetPokemonsUseCase();
    homeCubit = HomeCubit(getPokemonsUseCase: mockGetPokemonsUseCase);
    if (!ServiceLocatorImp.I.isRegistered<HomeCubit>()) {
      ServiceLocatorImp.I.registerFactory<HomeCubit>(() => homeCubit);
    }
    appWidget = makeAppWidget(const HomeScreen());
    for (var i = 0; i < 8; i++) {
      final pokemons = getPokemonsMockByPage(i);
      when(() => mockGetPokemonsUseCase.call(i))
          .thenAnswer((invocation) async => Result.success(pokemons));
    }
  });

  setUpAll(() async {
    ServiceLocatorImp(GetIt.instance);
  });

  group('HomeScreen integrity |', () {
    testWidgets('Check HomeScreen integrity', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(appWidget);

        final loadingFinder = find.ancestor(
          of: find.byType(CircularProgressIndicator),
          matching: find.byType(PokemonCardWidget),
        );

        await tester.pumpAndSettle();

        final imagePokeBallFinder = find.image(const AssetImage(Assets.pokeballImg));
        final appTitleFinder = find.ancestor(
          of: find.text('Pokédex'),
          matching: find.byType(AppBarWidget),
        );
        final gridFinder = find.byType(GridView);
        final pokemonCardFinder = find.byType(PokemonCardWidget);

        expect(loadingFinder, findsNothing);
        expect(imagePokeBallFinder, findsOneWidget);
        expect(appTitleFinder, findsOneWidget);
        expect(gridFinder, findsOneWidget);
        expect(pokemonCardFinder, findsWidgets);
      });
    });
  });

  group('HomeScreen behavior |', () {
    testWidgets(
        'When the sorting settings are changed, it should triggers the new state emission, having the sorted pokemons',
        (tester) async {});

    testWidgets(
        'When the search field is filled, it should triggers the new state emission, having the filtered pokemons',
        (tester) async {});

    testWidgets(
        'When clicking on the pokemon card then should navigate to the pokémon details screen',
        (tester) async {});

    testWidgets(
        'When clicking on the pokemon card with the loading state it should not navigate to the pokémon details screen',
        (tester) async {});

    testWidgets('Check if pagination with infinite scroll is correct', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(appWidget);
        await tester.pumpAndSettle();

        final pokemonCardFinder = find.byType(PokemonCardWidget);

        final pokemonCountBeforeScroll = List.from(homeCubit.state.pokemons).length;
        final pokemonCardCountBeforeScroll = tester.widgetList(pokemonCardFinder).length;

        final gridFinder = find.byType(GridView);

        await tester.fling(gridFinder, const Offset(0, -1000), 1000);
        await tester.pumpAndSettle();

        final pokemonCountAfterScroll = homeCubit.state.pokemons.length;
        final pokemonCardCountAfterScroll = tester.widgetList(pokemonCardFinder).length;

        expect(pokemonCountAfterScroll, greaterThan(pokemonCountBeforeScroll));
        expect(pokemonCardCountAfterScroll, greaterThan(pokemonCardCountBeforeScroll));

        verify(() => mockGetPokemonsUseCase.call(0)).called(1);
        verify(() => mockGetPokemonsUseCase.call(1)).called(1);
      });
    });
  });
}
