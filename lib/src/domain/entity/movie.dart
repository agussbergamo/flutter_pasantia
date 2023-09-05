class Movie {
  final String title;
  final String originalTitle;
  final String originalLanguage;
  final String releaseDate;
  final num voteAverage;
  final int voteCount;
  final List<int> genres;
  final String overview;
  final String backdrop;
  final bool rated;
  static const String baseUrl = 'https://image.tmdb.org/t/p/w500';

  String get fullBackdrop => '$baseUrl$backdrop';

  Movie({
    required this.title,
    required this.originalTitle,
    required this.originalLanguage,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.overview,
    required this.backdrop,
    required this.rated,
  });

  factory Movie.mockMovie() {
    return Movie(
      title: 'The Super Mario Bros. Movie',
      originalTitle: 'The Super Mario Bros. Movie',
      originalLanguage: 'English',
      releaseDate: '2023-04-05',
      voteAverage: 7.8,
      voteCount: 2586,
      genres: [1],
      overview:
          'While working underground to fix a water main, Brooklyn plumbers and brothers Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
      backdrop: 'assets/images/mariobros2.jpg',
      rated: false,
    );
  }

  factory Movie.fromJson(json) {
    return Movie(
      title: json['title'],
      originalTitle: json['original_title'],
      originalLanguage: json['original_language'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      genres: json['genre_ids'].cast<int>(),
      overview: json['overview'],
      backdrop: json['backdrop_path'],
      rated: json['adult'],
    );
  }
}
