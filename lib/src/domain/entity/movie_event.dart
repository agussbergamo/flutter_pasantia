import '../../core/parameter/status.dart';
import 'movie.dart';

class MovieEvent {
  MovieEvent({
    required this.status,
    this.moviesList,
    this.errorMsg,
  });

  final Status status;
  final List<Movie>? moviesList;
  final String? errorMsg;

  @override
  bool operator ==(movieEvent) =>
      movieEvent is MovieEvent && movieEvent.status == this.status;
}
