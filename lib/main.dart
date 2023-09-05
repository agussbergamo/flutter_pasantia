import 'package:flutter/material.dart';

import 'src/presentation/views/movie_detail.dart';
import 'src/presentation/views/movies_list.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: MoviesList.routeName,
      routes: {
        MoviesList.routeName: (context) => const MoviesList(),
        MovieDetail.routeName: (context) => const MovieDetail(),
      },
    ),
  );
}
