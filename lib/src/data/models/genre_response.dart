import '../../domain/entity/genre.dart';

class GenreResponse {
  final List<Genre> genres;

  GenreResponse({
    required this.genres,
  });

  factory GenreResponse.fromJson(Map<String, dynamic> json) => GenreResponse(
        genres: fromList(json['genres']),
      );

  static List<Genre> fromList(List<dynamic> json) {
    return List<Genre>.from(json.map((genre) => Genre.fromJson(genre)));
  }
}
