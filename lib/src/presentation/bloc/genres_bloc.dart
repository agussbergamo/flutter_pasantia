import 'dart:async';

import '../../core/parameter/status.dart';
import '../../domain/entity/genre_event.dart';
import '../../domain/usecase/implementation/get_genres_usecase.dart';
import 'i_genres_bloc.dart';

class GenresBloc implements IGenresBloc {
  late GetGenresUseCase genresUseCase;
  StreamController<GenreEvent> controller =
      StreamController<GenreEvent>.broadcast();

  Stream<GenreEvent> get genresStream => controller.stream;

  GenresBloc({
    required this.genresUseCase,
  });

  @override
  void dispose() {
    controller.close();
  }

  @override
  Future<void> initialize() async {}

  Future<void> getGenres() async {
    controller.sink.add(
      GenreEvent(
        status: Status.loading,
      ),
    );
    var response = await genresUseCase.call();
    if (response.errorMsg != null) {
      controller.sink.add(
        GenreEvent(
          status: Status.error,
          errorMsg: response.errorMsg,
        ),
      );
    } else {
      controller.sink.add(
        GenreEvent(
          status:
              response.data.genres.isNotEmpty ? Status.success : Status.empty,
          genresList: response.data.genres,
        ),
      );
    }
  }
}
