import '../../core/parameter/status.dart';
import 'genre.dart';

class GenreEvent {
  GenreEvent({
    required this.status,
    this.genresList,
    this.errorMsg,
  });

  final Status status;
  final List<Genre>? genresList;
  final String? errorMsg;

  @override
  bool operator ==(genreEvent) =>
      genreEvent is GenreEvent && genreEvent.status == this.status;
}
