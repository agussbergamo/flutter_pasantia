import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tmdb_agustina/src/core/parameter/status.dart';
import 'package:tmdb_agustina/src/core/util/ui_constants.dart';
import 'package:tmdb_agustina/src/domain/entity/genre.dart';
import 'package:tmdb_agustina/src/domain/entity/genre_event.dart';
import 'package:tmdb_agustina/src/domain/entity/movie.dart';
import 'package:tmdb_agustina/src/presentation/bloc/genres_bloc.dart';
import 'package:tmdb_agustina/src/presentation/views/movie_detail.dart';
import 'package:tmdb_agustina/src/presentation/widgets/buttons_bar.dart';
import 'package:tmdb_agustina/src/presentation/widgets/custom_progress_indicator.dart';
import 'package:tmdb_agustina/src/presentation/widgets/movie_header.dart';
import 'package:tmdb_agustina/src/presentation/widgets/movie_overview.dart';

class MockGenresBloc extends Mock implements GenresBloc {
  final StreamController<GenreEvent> controller =
      StreamController<GenreEvent>.broadcast();

  @override
  Stream<GenreEvent> get genresStream => controller.stream;

  void dispose() {
    controller.close();
  }
}

void main() {
  late GenresBloc _genresBloc;
  final Map<String, dynamic> args = {
    'movie': Movie.mockMovie(),
  };

  setUp(() {
    _genresBloc = MockGenresBloc();
  });

  Widget _widgetToTest() {
    return MaterialApp(
      home: Navigator(
        onGenerateRoute: (_) {
          return MaterialPageRoute<Widget>(
            builder: (_) => MovieDetail(
              genresBloc: _genresBloc,
            ),
            settings: RouteSettings(
              arguments: args,
            ),
          );
        },
      ),
    );
  }

  testWidgets(
      'Tests that MovieDetail screen is rendered correctly searching by all of its sub-widgets',
      (WidgetTester tester) async {
    List<Genre> genresList = [];
    Genre genre = Genre(
      id: 1,
      name: 'Adventure',
    );
    genresList.add(genre);
    GenreEvent genreEvent = GenreEvent(
      status: Status.success,
      genresList: genresList,
    );
    when(() => _genresBloc.getGenres())
        .thenAnswer((_) async => _genresBloc.controller.sink.add(genreEvent));
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(_widgetToTest());
    });
    final safeAreaFinder = find.byWidgetPredicate((widget) {
      if (widget is SafeArea) {
        return widget.child is Scaffold;
      }
      return false;
    });
    expect(safeAreaFinder, findsOneWidget);
    final scaffoldColor =
        tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;
    expect(scaffoldColor, UIConstants.backgroundColor);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Column), findsWidgets);
    expect(find.byKey(const Key('appBarIcon')), findsOneWidget);
    expect(find.byType(MovieHeader), findsOneWidget);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(SizedBox), findsWidgets);
    expect(find.byType(ButtonsBar), findsOneWidget);
    expect(find.byType(MovieOverview), findsOneWidget);
    expect(find.byType(StreamBuilder<GenreEvent>), findsOneWidget);
    expect(find.byType(CustomProgressIndicator), findsOneWidget);
  });
}
