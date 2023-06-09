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

  setUp(() {
    appWidget = makeAppWidget(const HomeScreen());
    final pokemons = getPokemonsMockByPage(0);
    when(() => mockGetPokemonsUseCase.call(any()))
        .thenAnswer((invocation) async => Result.success(pokemons));
  });

  setUpAll(() async {
    mockGetPokemonsUseCase = MockGetPokemonsUseCase();
    ServiceLocatorImp(GetIt.instance)
        .registerFactory<HomeCubit>(() => HomeCubit(getPokemonsUseCase: mockGetPokemonsUseCase));
  });

  testWidgets('Verify HomeScreen integrity', (tester) async {
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
}
