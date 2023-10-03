import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tmdb_agustina/src/domain/entity/movie.dart';
import 'package:tmdb_agustina/src/presentation/widgets/movie_grid_item.dart';

void main() {
  List<Movie> moviesList = [];
  moviesList.add(Movie.mockMovie());

  Widget _widgetToTest() {
    return MaterialApp(
      home: MovieGridItem(
        moviesList: moviesList,
        index: 0,
      ),
    );
  }

  testWidgets(
      'Tests that MovieGridItem is rendered correctly searching by all of its sub-widgets',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(_widgetToTest());
    });
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(SizedBox), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
  });
}
