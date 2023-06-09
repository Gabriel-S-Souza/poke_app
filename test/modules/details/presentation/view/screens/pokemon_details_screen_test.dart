import 'package:flutter_test/flutter_test.dart';

void main() {
  // TODO(test): make tests
  group('PokemonDetailsScreen integrity |', () {
    testWidgets('Check PokemonDetailsScreen integrity', (tester) async {
      // on loading should have a progress indicator
      // should have a PokeBallPositionedWidget, a HeaderScreenWidget, a TypeTagsWidget
      // a 'About' text, a 'Base Stats' text, a RowPokeInfoWidget, a PokeStatisticsWidget
      // and a PokeFloatingImageWidget having a image and two buttons into Visibility
    });
  });

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
