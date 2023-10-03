import 'dart:async';

import '../../core/parameter/endpoint.dart';
import '../../core/parameter/status.dart';
import '../../domain/entity/movie_event.dart';
import '../../domain/usecase/implementation/get_movies_usecase.dart';
import 'i_movies_bloc.dart';

class MoviesBloc implements IMoviesBloc {
  final GetMoviesUseCase moviesUseCase;
  StreamController<MovieEvent> controller =
      StreamController<MovieEvent>.broadcast();

  Stream<MovieEvent> get moviesStream => controller.stream;

  MoviesBloc({
    required this.moviesUseCase,
  });

  @override
  void dispose() {
    controller.close();
  }

  @override
  Future<void> initialize() async {}

  Future<void> getMoviesByType(Endpoint endpoint) async {
    var response = await moviesUseCase
        .call(<String, String>{'endpoint': '${endpoint.name}'});
    MovieEvent movieEvent = response.errorMsg != null
        ? MovieEvent(
            status: Status.error,
            errorMsg: response.errorMsg,
          )
        : MovieEvent(
            status: response.data.results.isNotEmpty
                ? Status.success
                : Status.empty,
            moviesList: response.data.results,
          );
    controller.sink.add(movieEvent);
  }
}
