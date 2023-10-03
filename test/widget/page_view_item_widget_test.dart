import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tmdb_agustina/src/domain/entity/movie.dart';
import 'package:tmdb_agustina/src/presentation/widgets/movie_list_header.dart';
import 'package:tmdb_agustina/src/presentation/widgets/page_view_item.dart';

void main() {
  final Movie movie = Movie.mockMovie();

  Widget _widgetToTest() {
    return MaterialApp(
      home: PageViewItem(
        movie: movie,
      ),
    );
  }

  testWidgets(
      'Tests that PageViewItem is rendered correctly searching by all of its sub-widgets',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(_widgetToTest());
    });
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Icon), findsNWidgets(2));
    expect(find.byType(MovieListHeader), findsOneWidget);
    expect(find.byType(SizedBox), findsWidgets);
    expect(find.byType(Expanded), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
