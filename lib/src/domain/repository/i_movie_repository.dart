import '../../data/models/movie_response.dart';
import '../entity/response.dart';
import 'i_repository.dart';

abstract class IMovieRepository<Movie> implements IRepository<MovieResponse> {
  @override
  Future<MovieResponse> getModel();

  Future<Response> getMoviesByType(String endpoint);
}
