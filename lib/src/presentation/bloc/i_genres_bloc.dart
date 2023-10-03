import '../../core/bloc/i_bloc.dart';
import '../../domain/entity/genre_event.dart';

abstract class IGenresBloc implements IBloc {
  Stream<GenreEvent> get genresStream;

  Future<void> getGenres();
}
