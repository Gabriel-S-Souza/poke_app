import 'package:flutter_test/flutter_test.dart';

void main() {
  // TODO(test): make tests
  group('PokeFloatingImageWidget integrity |', () {
    testWidgets('Check PokeFloatingImageWidget integrity', (tester) async {
      // on loading should not show the image and the buttons
      // should have a image, a back button and a foward button
    });
  });

  group('PokeFloatingImageWidget behavior |', () {
    testWidgets(
        'When to click on arrow left button, case visible, should be called the onLeftPressed callback',
        (tester) async {});

    testWidgets(
        'When to click on arrow right button, case visible, should be called the onRightPressed callback',
        (tester) async {});
  });
}
