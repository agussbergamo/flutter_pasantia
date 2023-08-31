import 'package:flutter/material.dart';

import 'presentation/pages/movie_detail.dart';
import 'presentation/pages/movies_list.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: MoviesList.routeName,
      routes: {
        MoviesList.routeName: (context) => const MoviesList(),
        MovieDetail.routeName: (context) => MovieDetail(),
      },
    ),
  );
}
