import 'package:flutter/material.dart';

import 'buttons_bar.dart';
import 'movie.dart';
import 'movie_header.dart';
import 'movie_info.dart';
import 'movie_overview.dart';
import 'ui_constants.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Movie movie = Movie.mockMovie();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: UIConstants.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              MovieHeader(
                backdrop: movie.backdrop,
                title: movie.title,
              ),
              Padding(
                padding: const EdgeInsets.all(
                  UIConstants.columnPadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const ButtonsBar(),
                    UIConstants.sectionSpace,
                    MovieOverview(
                      overviewText: movie.overview,
                    ),
                    UIConstants.sectionSpace,
                    MovieInfo(
                      originalTitleText: movie.originalTitle,
                      dateText: movie.releaseDate,
                      voteText: movie.voteAverage,
                      genresText: movie.genres,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
