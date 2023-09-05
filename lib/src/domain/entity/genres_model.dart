import 'genre.dart';

class GenresModel {
  final List<Genre> genres;

  GenresModel({
    required this.genres,
  });

  factory GenresModel.fromJson(List<dynamic> jsonList) => GenresModel(
        genres: List<Genre>.from(
          jsonList.map(
            (genre) => Genre.fromJson(genre),
          ),
        ),
      );

  List<String> convertIntToString(List<int> intGenres) {
    return intGenres
        .map((id) => genres.firstWhere((genre) => genre.id == id).name)
        .toList();
  }
}
