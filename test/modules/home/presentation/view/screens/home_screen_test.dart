import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:poke_app/core/di/service_locator_imp.dart';
import 'package:poke_app/core/utils/assets.dart';
import 'package:poke_app/modules/details/domain/usecases/get_pokemon_details_use_case.dart';
import 'package:poke_app/modules/details/presentation/cubits/pokemon_details_cubit.dart';
import 'package:poke_app/modules/details/presentation/view/screens/pokemon_details_screen.dart';
import 'package:poke_app/modules/home/domain/usecases/pokemon_use_case.dart';
import 'package:poke_app/modules/home/presentation/cubits/home_cubit.dart';
import 'package:poke_app/modules/home/presentation/view/screens/home_screen.dart';
import 'package:poke_app/modules/home/presentation/view/widgets/app_bar_widget.dart';
import 'package:poke_app/modules/home/presentation/view/widgets/pokemon_card_widget.dart';
import 'package:poke_app/modules/home/presentation/view/widgets/radio_tile_widget.dart';
import 'package:poke_app/modules/home/presentation/view/widgets/text_field_widget.dart';
import 'package:poke_app/shared/domain/entities/result/result.dart';

import '../../../../../mocks/pokemon_details_mock.dart';
import '../../../../../mocks/pokemons_mock_by_page.dart';
import '../../../../../setup/make_app_widget.dart';

class MockGetPokemonsUseCase extends Mock implements GetPokemonsUseCase {}

class MockGetPokemonDetailsUseCase extends Mock implements GetPokemonDetailsUseCase {}

void main() {
  late Widget appWidget;
  late MockGetPokemonsUseCase mockGetPokemonsUseCase;
  late MockGetPokemonDetailsUseCase mockGetPokemonDetailsUseCase;
  late HomeCubit homeCubit;

  setUp(() {
    mockGetPokemonsUseCase = MockGetPokemonsUseCase();
    homeCubit = HomeCubit(getPokemonsUseCase: mockGetPokemonsUseCase);
    mockGetPokemonDetailsUseCase = MockGetPokemonDetailsUseCase();

    for (var i = 0; i < 8; i++) {
      final pokemons = getPokemonsMockByPage(i);
      when(() => mockGetPokemonsUseCase.call(i))
          .thenAnswer((invocation) async => Result.success(pokemons));
    }

    when(() => mockGetPokemonDetailsUseCase.call(any()))
        .thenAnswer((invocation) async => Result.success(pokemonDetailsMock));

    if (!ServiceLocatorImp.I.isRegistered<HomeCubit>()) {
      ServiceLocatorImp.I.registerFactory<HomeCubit>(() => homeCubit);
    }
    if (!ServiceLocatorImp.I.isRegistered<PokemonDetailsCubit>()) {
      ServiceLocatorImp.I.registerFactory<PokemonDetailsCubit>(
          () => PokemonDetailsCubit(getPokemonDetailsUseCase: mockGetPokemonDetailsUseCase));
    }
    appWidget = makeAppWidget(child: const HomeScreen());
  });

  setUpAll(() async {
    ServiceLocatorImp(GetIt.instance);
  });

  group('HomeScreen integrity |', () {
    testWidgets('Check HomeScreen integrity', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(appWidget);

        await tester.pumpAndSettle();

        final imagePokeBallFinder = find.image(const AssetImage(Assets.pokeballImg));
        final appTitleFinder = find.ancestor(
          of: find.text('Pokédex'),
          matching: find.byType(AppBarWidget),
        );
        final gridFinder = find.byType(GridView);
        final pokemonCardFinder = find.byType(PokemonCardWidget);

        expect(imagePokeBallFinder, findsOneWidget);
        expect(appTitleFinder, findsOneWidget);
        expect(gridFinder, findsOneWidget);
        expect(pokemonCardFinder, findsWidgets);
      });
    });
  });

  group('HomeScreen behavior |', () {
    testWidgets(
        'When opening, should call HomeCubit.getPokemons loading the first pokemons page in the Gridview',
        (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(appWidget);

        await tester.pumpAndSettle();

        final gridFinder = find.byType(GridView);
        final pokemonCardFinder = find.byType(PokemonCardWidget);

        expect(gridFinder, findsOneWidget);
        expect(pokemonCardFinder, findsWidgets);

        verify(() => mockGetPokemonsUseCase.call(0)).called(1);
      });
    });

    testWidgets(
        'When the sorting option are changed, it should updates the pokemons grid with the pokemons sorted by the new option',
        (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(appWidget);
        await tester.pumpAndSettle();

        final pokemonCardsPrevious =
            List<PokemonCardWidget>.from(tester.widgetList(find.byType(PokemonCardWidget)));

        final sortButtonFinder = find.byKey(const Key('sortButton'));

        await tester.tap(sortButtonFinder);
        await tester.pump();

        final radioSortByNameFinder = find.byWidgetPredicate(
            (widget) => widget is RadioTileWidget && widget.value == SortPokeBy.name);

        // Change the sorting settings to sort by name
        await tester.tap(radioSortByNameFinder);
        await tester.pumpAndSettle();

        final pokemonCardsCurrent =
            List<PokemonCardWidget>.from(tester.widgetList(find.byType(PokemonCardWidget)));

        final Matcher cardsAreSortedByName = pairwiseCompare<PokemonCardWidget, PokemonCardWidget>(
          pokemonCardsCurrent,
          (a, b) => a.pokemon.name.compareTo(b.pokemon.name) <= 0,
          'Cards are sorted by name',
        );

        expect(pokemonCardsPrevious, isNot(cardsAreSortedByName));
        expect(pokemonCardsCurrent, cardsAreSortedByName);
      });
    });

    testWidgets(
        'When the search field is filled, it should updates the pokemons grid with the pokemons that contains the query',
        (tester) async {
      await mockNetworkImagesFor(() async {
        const query = 'char';

        await tester.pumpWidget(appWidget);
        await tester.pumpAndSettle();

        final pokemonCardsPrevious =
            List<PokemonCardWidget>.from(tester.widgetList(find.byType(PokemonCardWidget)));

        // Fill the search field with the query
        await tester.enterText(find.byType(TextFieldWidget), query);
        await tester.pumpAndSettle();

        final pokemonCardsCurrent =
            List<PokemonCardWidget>.from(tester.widgetList(find.byType(PokemonCardWidget)));

        final Matcher allCardsContainsQuery = everyElement(isA<PokemonCardWidget>().having(
          (e) =>
              e.pokemon.name.contains(query.toLowerCase()) ||
              e.pokemon.id.toString().contains(query.toLowerCase()),
          'name',
          true,
        ));

        expect(pokemonCardsCurrent.length, lessThan(pokemonCardsPrevious.length));
        expect(pokemonCardsCurrent, allCardsContainsQuery);
      });
    });

    testWidgets(
        'When clicking on the pokémon card then must navigate to the pokémon details screen of the clicked pokémon',
        (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(appWidget);
        await tester.pumpAndSettle();

        const pokeIdClicked = 1;

        final firstPokemonCardFinder = find.byWidgetPredicate(
          (widget) => widget is PokemonCardWidget && widget.pokemon.id == pokeIdClicked,
        );

        // Click on the pokemon card with id 1
        await tester.tap(firstPokemonCardFinder);
        await tester.pumpAndSettle();

        final detailsScreenFinder = find.byType(PokemonDetailsScreen);

        final idPassed = tester.firstWidget<PokemonDetailsScreen>(detailsScreenFinder).pokemonId;

        expect(detailsScreenFinder, findsOneWidget);
        expect(idPassed, equals(pokeIdClicked));
      });
    });

    testWidgets('When clicking on the pokemon card with the loading state do nothing',
        (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(appWidget);

        final cardWithLoadingFinder = find.ancestor(
          of: find.byType(CircularProgressIndicator),
          matching: find.byType(PokemonCardWidget),
        );

        // Click on the pokemon card with loading state
        await tester.tap(cardWithLoadingFinder);
        await tester.pumpAndSettle();

        final detailsScreenFinder = find.byType(PokemonDetailsScreen);

        expect(detailsScreenFinder, findsNothing);
      });
    });

    testWidgets('Check if pagination with infinite scroll is correct', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(appWidget);
        await tester.pumpAndSettle();

        final pokemonCardFinder = find.byType(PokemonCardWidget);

        final pokemonCountBeforeScroll = List.from(homeCubit.state.pokemons).length;
        final pokemonCardCountBeforeScroll = tester.widgetList(pokemonCardFinder).length;

        final gridFinder = find.byType(GridView);

        // Scroll to the bottom of the grid
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
