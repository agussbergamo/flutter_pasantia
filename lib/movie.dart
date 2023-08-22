class Movie {
  final String title;
  final String originalTitle;
  final String releaseDate;
  final String voteAverage;
  final String genres;
  final String overview;
  final String backdrop;

  Movie({
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.voteAverage,
    required this.genres,
    required this.overview,
    required this.backdrop,
  });

  factory Movie.mockMovie() {
    return Movie(
        title: 'The Super Mario Bros. Movie',
        originalTitle: 'The Super Mario Bros. Movie',
        releaseDate: '2023-04-05',
        voteAverage: '7.8',
        genres: 'Animation, Family, Adventure, Fantasy, Comedy',
        overview:
            'While working underground to fix a water main, Brooklyn plumbers and brothers Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
        backdrop: 'assets/images/mariobros2.jpg');
  }
}
