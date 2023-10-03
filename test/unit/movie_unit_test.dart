import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_agustina/src/domain/entity/movie.dart';

void main() async {
  late Movie _mockMovie;

  setUp(() {
    _mockMovie = Movie.mockMovie();
  });

  test('The method fromJson returns a Movie instance', () async {
    final Map<String, dynamic> jsonMovie = {
      'title': 'The Super Mario Bros. Movie',
      'original_title': 'The Super Mario Bros. Movie',
      'original_language': 'English',
      'release_date': '2023-04-05',
      'vote_average': 7.8,
      'vote_count': 2586,
      'genre_ids': [1],
      'overview':
          'While working underground to fix a water main, Brooklyn plumbers and brothers Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
      'backdrop_path': 'assets/images/mariobros2.jpg',
      'poster_path': 'assets/images/mariobros1.jpg',
      'adult': false,
    };
    Movie movie = Movie.fromJson(jsonMovie);
    expect(movie, _mockMovie);
  });
}
