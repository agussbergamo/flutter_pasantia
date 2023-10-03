import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_agustina/src/core/util/ui_constants.dart';
import 'package:tmdb_agustina/src/presentation/widgets/buttons_bar.dart';
import 'package:tmdb_agustina/src/presentation/widgets/plain_text.dart';

void main() {
  const int voteAverage = 1;
  const int voteCount = 1;

  Widget _widgetToTest() {
    return MaterialApp(
      home: Scaffold(
        body: ButtonsBar(
          voteAverage: voteAverage,
          voteCount: voteCount,
        ),
      ),
    );
  }

  testWidgets(
      'Tests that ButtonsBar is rendered correctly searching by all of its sub-widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(_widgetToTest());
    expect(find.byType(Row), findsNWidgets(4));
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Icon), findsWidgets);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(PlainText), findsNWidgets(3));
    expect(find.byType(SizedBox), findsWidgets);
    final boxDecoration = tester
        .widget<Container>(find.byType(Container))
        .decoration as BoxDecoration;
    expect(boxDecoration.border?.top.color, UIConstants.contrastColor);
  });
}
