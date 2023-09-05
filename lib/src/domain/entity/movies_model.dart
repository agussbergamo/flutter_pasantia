import 'movie.dart';

class MoviesModel {
  final List<Movie> movies;

  MoviesModel({
    required this.movies,
  });

  factory MoviesModel.fromJson(List<dynamic> jsonList) => MoviesModel(
        movies:
            List<Movie>.from(jsonList.map((movie) => Movie.fromJson(movie))),
      );
}
