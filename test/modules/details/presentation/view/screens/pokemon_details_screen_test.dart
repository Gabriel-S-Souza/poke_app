import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:poke_app/core/di/service_locator_imp.dart';
import 'package:poke_app/modules/details/domain/usecases/get_pokemon_details_use_case.dart';
import 'package:poke_app/modules/details/presentation/cubits/pokemon_details_cubit.dart';
import 'package:poke_app/modules/details/presentation/view/screens/pokemon_details_screen.dart';
import 'package:poke_app/modules/details/presentation/view/widgets/header_screen_widget.dart';
import 'package:poke_app/modules/details/presentation/view/widgets/poke_ball_positioned_widget.dart';
import 'package:poke_app/modules/details/presentation/view/widgets/poke_floating_image_widget.dart';
import 'package:poke_app/modules/details/presentation/view/widgets/poke_statistics_widget.dart';
import 'package:poke_app/modules/details/presentation/view/widgets/row_poke_info_widget.dart';
import 'package:poke_app/modules/home/domain/usecases/pokemon_use_case.dart';
import 'package:poke_app/modules/home/presentation/cubits/home_cubit.dart';
import 'package:poke_app/modules/home/presentation/view/widgets/pokemon_card_widget.dart';
import 'package:poke_app/shared/domain/entities/result/result.dart';

import '../../../../../mocks/pokemon_details_mock.dart';
import '../../../../../mocks/pokemons_mock_by_page.dart';
import '../../../../../setup/make_app_widget.dart';

class MockGetPokemonsUseCase extends Mock implements GetPokemonsUseCase {}

class MockGetPokemonDetailsUseCase extends Mock implements GetPokemonDetailsUseCase {}

void main() {
  late Widget appWidget;
  late MockGetPokemonDetailsUseCase mockGetPokemonDetailsUseCase;
  late PokemonDetailsCubit pokemonDetailsCubit;
  late MockGetPokemonsUseCase mockGetPokemonsUseCase;

  setUp(() {
    mockGetPokemonDetailsUseCase = MockGetPokemonDetailsUseCase();
    mockGetPokemonsUseCase = MockGetPokemonsUseCase();
    pokemonDetailsCubit =
        PokemonDetailsCubit(getPokemonDetailsUseCase: mockGetPokemonDetailsUseCase);

    when(() => mockGetPokemonsUseCase.call(any())).thenAnswer((invocation) async => Result.success(
          getPokemonsMockByPage(0),
        ));
    when(() => mockGetPokemonDetailsUseCase.call(any()))
        .thenAnswer((invocation) async => Result.success(pokemonDetailsMock));

    if (!ServiceLocatorImp.I.isRegistered<HomeCubit>()) {
      ServiceLocatorImp.I.registerFactory<HomeCubit>(() => HomeCubit(
            getPokemonsUseCase: mockGetPokemonsUseCase,
          ));
    }
    if (!ServiceLocatorImp.I.isRegistered<PokemonDetailsCubit>()) {
      ServiceLocatorImp.I.registerFactory<PokemonDetailsCubit>(() => pokemonDetailsCubit);
    }

    appWidget = makeAppWidget();
  });

  setUpAll(() {
    ServiceLocatorImp(GetIt.instance);
  });

  Future<void> navigateToDetailsScreen(WidgetTester tester) async {
    final firstPokemonCard = find.byType(PokemonCardWidget).first;
    await tester.ensureVisible(firstPokemonCard);
    await tester.tap(firstPokemonCard);
  }

  group('PokemonDetailsScreen integrity |', () {
    testWidgets('Check PokemonDetailsScreen integrity', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(appWidget);
        await tester.pumpAndSettle();

        await navigateToDetailsScreen(tester);
        await tester.pumpAndSettle();

        final detailsScreenFinder = find.byType(PokemonDetailsScreen);
        final pokeBallPositionedFinder = find.byType(PokeBallPositionedWidget);
        final headerScreenFinder = find.byType(HeaderScreenWidget);
        final aboutTextFinder = find.text('About');
        final baseStatsTextFinder = find.text('Base Stats');
        final rowPokeInfoFinder = find.byType(RowPokeInfoWidget);
        final pokeStatisticsFinder = find.byType(PokeStatisticsWidget);
        final pokeFloatingImageFinder = find.byType(PokeFloatingImageWidget);
        final pokeImageFinder = find.ancestor(
          of: find.ancestor(
            of: find.byType(Image),
            matching: find.byType(Visibility),
          ),
          matching: pokeFloatingImageFinder,
        );

        expect(detailsScreenFinder, findsOneWidget);
        expect(pokeBallPositionedFinder, findsOneWidget);
        expect(headerScreenFinder, findsOneWidget);
        expect(aboutTextFinder, findsOneWidget);
        expect(baseStatsTextFinder, findsOneWidget);
        expect(rowPokeInfoFinder, findsOneWidget);
        expect(pokeStatisticsFinder, findsOneWidget);
        expect(pokeFloatingImageFinder, findsOneWidget);
        expect(pokeImageFinder, findsNWidgets(2));
      });
    });
  });

  // TODO(test): make remaining tests

  group('PokemonDetailsScreen behavior |', () {
    testWidgets(
        'When to click on arrow left button, case visible, should navigate to details of the pokemon with previous id',
        (tester) async {});

    testWidgets(
        'When to click on arrow right button, case visible, should navigate to details of the pokemon with next id',
        (tester) async {});

    testWidgets('When to click on back button should navigate to home screen', (tester) async {});
  });
}
