import '../../models/genre_response.dart';
import '../../models/movie_response.dart';

abstract class IApiService {
  Future<MovieResponse> getMoviesByType({required String endpoint});

  Future<GenreResponse> getGenres({required String endpoint});
}
