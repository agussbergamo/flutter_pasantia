import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_agustina/src/presentation/widgets/plain_text.dart';

void main() {
  const String text = 'Text for testing';

  Widget _widgetToTest() {
    return const MaterialApp(
      home: PlainText(
        text: text,
      ),
    );
  }

  testWidgets(
      'Tests that Plaintext is rendered correctly searching by its sub-widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(_widgetToTest());
    expect(find.byType(Text), findsOneWidget);
  });
}
