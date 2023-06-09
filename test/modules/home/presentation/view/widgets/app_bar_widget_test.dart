import 'package:flutter_test/flutter_test.dart';

void main() {
  // TODO(test): make tests
  group('AppBarWidget integrity |', () {
    testWidgets('Check AppBarWidget integrity', (tester) async {
      // should have a pokeball image, the app title, a TextFieldWidet and a SortButtonWidget
    });
  });

  group('AppBarWidget behavior |', () {
    testWidgets(
        'When to write in the text field should be called the onSearch callback passing the added text',
        (tester) async {});

    testWidgets(
        'When to receive a call of onSelected from SortButtonWidget, should be called the onSort callback passing a SortPokeBy',
        (tester) async {});
  });
}
