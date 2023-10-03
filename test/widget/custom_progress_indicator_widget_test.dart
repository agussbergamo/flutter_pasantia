import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_agustina/src/presentation/widgets/custom_progress_indicator.dart';

void main() {
  testWidgets(
      'Tests that CustomProgressIndicator is rendered correctly searching by all of its sub-widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(const CustomProgressIndicator());
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
