import '../../core/bloc/i_bloc.dart';
import '../../core/parameter/endpoint.dart';
import '../../domain/entity/movie_event.dart';

abstract class IMoviesBloc implements IBloc {
  Stream<MovieEvent> get moviesStream;

  Future<void> getMoviesByType(Endpoint endpoint);
}
