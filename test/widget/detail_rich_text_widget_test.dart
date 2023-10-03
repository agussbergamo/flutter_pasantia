import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_agustina/src/presentation/widgets/detail_rich_text.dart';

void main() {
  const String subtitle = 'Subtitle for testing';
  const String text = 'Text for testing';

  Widget _widgetToTest() {
    return const MaterialApp(
      home: DetailRichText(
        subtitle: subtitle,
        text: text,
      ),
    );
  }

  testWidgets(
      'Tests that DetailRichText widget is rendered correctly searching by parameters',
      (WidgetTester tester) async {
    await tester.pumpWidget(_widgetToTest());
    final subtitleFinder = find.text(subtitle);
    final textFinder = find.text(text);
    expect(subtitleFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);
  });

  testWidgets(
      'Tests that DetailRichText widget is rendered correctly searching by one of its children',
      (WidgetTester tester) async {
    await tester.pumpWidget(_widgetToTest());
    expect(find.byType(Text), findsWidgets);
  });

  testWidgets(
      'Tests that DetailRichText is rendered correctly searching by all of its sub-widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(_widgetToTest());
    final detailRichTextFinder = find.byWidgetPredicate(
      (Widget widget) {
        return widget is DetailRichText;
      },
    );
    expect(detailRichTextFinder, findsOneWidget);
    final rowFinder = find.descendant(
      of: detailRichTextFinder,
      matching: find.byWidgetPredicate(
        (Widget widget) {
          return widget is Row;
        },
      ),
    );
    expect(rowFinder, findsOneWidget);
    expect(
      find.descendant(
        of: rowFinder,
        matching: find.byWidgetPredicate(
          (Widget widget) {
            return widget is Icon ||
                widget is SizedBox ||
                widget is Text ||
                widget is Expanded;
          },
        ),
      ),
      findsWidgets,
    );
  });
}
