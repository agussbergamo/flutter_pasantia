import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_agustina/src/presentation/widgets/app_drawer.dart';

void main() {
  Widget _widgetToTest() {
    return const MaterialApp(
      home: AppDrawer(),
    );
  }

  testWidgets(
      'Tests that AppDrawer is rendered correctly searching by all of its sub-widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(_widgetToTest());
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(DrawerHeader), findsOneWidget);
    expect(find.byType(Align), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(4));
    expect(find.byType(Text), findsNWidgets(5));
  });
}
