import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_app/core/utils/assets.dart';
import 'package:poke_app/modules/home/presentation/view/widgets/app_bar_widget.dart';
import 'package:poke_app/modules/home/presentation/view/widgets/radio_tile_widget.dart';
import 'package:poke_app/modules/home/presentation/view/widgets/sort_button_widget.dart';
import 'package:poke_app/modules/home/presentation/view/widgets/text_field_widget.dart';

import '../../../../../setup/make_app_widget.dart';

class MockSortCallback extends Mock {
  void call(SortPokeBy sort);
}

class MockSearchCallback extends Mock {
  void call(String search);
}

void main() {
  late Widget appWidget;
  late MockSortCallback mockSortCallback;
  late MockSearchCallback mockSearchCallback;
  late TextEditingController searchController;

  setUp(() {
    mockSortCallback = MockSortCallback();
    mockSearchCallback = MockSearchCallback();
    searchController = TextEditingController();
    appWidget = makeAppWidget(
      defaultConfig: false,
      child: Scaffold(
        body: AppBarWidget(
          onSort: mockSortCallback.call,
          onSearch: mockSearchCallback.call,
          searchController: searchController,
          currentSortBy: SortPokeBy.number,
        ),
      ),
    );
  });

  setUpAll(() {
    registerFallbackValue(SortPokeBy.number);
  });

  group('AppBarWidget integrity |', () {
    testWidgets('Check AppBarWidget integrity', (tester) async {
      await tester.pumpWidget(appWidget);
      await tester.pumpAndSettle();

      final pokeballImageFinder = find.image(const AssetImage(Assets.pokeballImg));
      final appTitleFinder = find.text('Pokédex');
      final textFieldFinder = find.byType(TextFieldWidget);
      final sortButtonFinder = find.byType(SortButtonWidget);

      expect(pokeballImageFinder, findsOneWidget);
      expect(appTitleFinder, findsOneWidget);
      expect(textFieldFinder, findsOneWidget);
      expect(sortButtonFinder, findsOneWidget);
    });
  });

  group('AppBarWidget behavior |', () {
    testWidgets(
        'When to write in the text field should be called the onSearch callback passing the added text',
        (tester) async {
      final searchParams = <String>[];

      when(() => mockSearchCallback.call(any())).thenAnswer((invocation) {
        searchParams.add(invocation.positionalArguments[0] as String);
      });

      await tester.pumpWidget(appWidget);
      await tester.pumpAndSettle();

      final textFieldFinder = find.byType(TextFieldWidget);
      final textFieldWidget = tester.widget<TextFieldWidget>(textFieldFinder);

      await tester.enterText(find.byWidget(textFieldWidget), 'c');
      await tester.enterText(find.byWidget(textFieldWidget), 'ch');
      await tester.enterText(find.byWidget(textFieldWidget), 'cha');
      await tester.pump();

      expect(searchParams, containsAll(['c', 'ch', 'cha']));
      verify(() => mockSearchCallback.call(any())).called(3);
    });

    testWidgets(
        'When to receive a call of onSelected from SortButtonWidget, should be called the onSort callback passing a SortPokeBy',
        (tester) async {
      late SortPokeBy sortOptionParam;

      when(() => mockSortCallback.call(any())).thenAnswer((invocation) {
        sortOptionParam = invocation.positionalArguments[0] as SortPokeBy;
      });

      await tester.pumpWidget(appWidget);
      await tester.pumpAndSettle();

      final sortButtonWidget = tester.widget<SortButtonWidget>(find.byType(SortButtonWidget));

      await tester.tap(find.byWidget(sortButtonWidget));
      await tester.pumpAndSettle();

      final radioTileWidgetFinder = find.byWidgetPredicate(
          (widget) => widget is RadioTileWidget && widget.value == SortPokeBy.name);
      final radioTileWidget = tester.widget<RadioTileWidget>(radioTileWidgetFinder);

      await tester.tap(find.byWidget(radioTileWidget));
      await tester.pumpAndSettle();

      expect(sortOptionParam, equals(SortPokeBy.name));
      verify(() => mockSortCallback.call(any())).called(1);
    });
  });
}
