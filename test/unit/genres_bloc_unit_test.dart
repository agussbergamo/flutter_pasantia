import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_agustina/src/core/parameter/status.dart';
import 'package:tmdb_agustina/src/data/models/genre_response.dart';
import 'package:tmdb_agustina/src/domain/entity/genre.dart';
import 'package:tmdb_agustina/src/domain/entity/genre_event.dart';
import 'package:tmdb_agustina/src/domain/entity/response.dart';
import 'package:tmdb_agustina/src/domain/usecase/implementation/get_genres_usecase.dart';
import 'package:tmdb_agustina/src/presentation/bloc/genres_bloc.dart';

class MockGetGenresUseCase extends Mock implements GetGenresUseCase {}

void main() async {
  late GetGenresUseCase _getGenresUseCase;
  late GenresBloc _genresBloc;

  setUp(() {
    _getGenresUseCase = MockGetGenresUseCase();
    _genresBloc = GenresBloc(
      genresUseCase: _getGenresUseCase,
    );
  });

  test('The method getGenres adds GenreEvent instances to the stream',
      () async {
    when(() => _getGenresUseCase.call())
        .thenAnswer((_) async => const ResponseError('Error'));
    _genresBloc.getGenres();
    _genresBloc.genresStream.listen(expectAsync1((event) {
      expect(event, isInstanceOf<GenreEvent>());
    }));
  });

  test(
      'The method getGenres creates a GenreEvent with status error and an error message when the call fails',
      () async {
    when(() => _getGenresUseCase.call())
        .thenAnswer((_) async => const ResponseError('Error'));
    expectLater(
        _genresBloc.genresStream,
        emitsInOrder([
          GenreEvent(
            status: Status.loading,
          ),
          GenreEvent(
            status: Status.error,
            errorMsg: 'Error',
          )
        ]));
    _genresBloc.getGenres();
  });

  test(
      'The method getGenres creates a GenreEvent with status success and genres data when the call is successful',
      () async {
    List<Genre> genresList = [];
    Genre genre = Genre(
      id: 1,
      name: 'Adventure',
    );
    genresList.add(genre);
    GenreResponse genreResponse = GenreResponse(genres: genresList);
    when(() => _getGenresUseCase.call())
        .thenAnswer((_) async => ResponseSuccess(genreResponse));
    expectLater(
        _genresBloc.genresStream,
        emitsInOrder([
          GenreEvent(
            status: Status.loading,
          ),
          GenreEvent(
            status: Status.success,
            genresList: genreResponse.genres,
          )
        ]));
    _genresBloc.getGenres();
  });

  test(
      'The method getGenres creates a GenreEvent with status empty when the call is successful but there is no data',
      () async {
    List<Genre> genresList = [];
    GenreResponse genreResponse = GenreResponse(genres: genresList);
    when(() => _getGenresUseCase.call())
        .thenAnswer((_) async => ResponseSuccess(genreResponse));
    expectLater(
        _genresBloc.genresStream,
        emitsInOrder([
          GenreEvent(
            status: Status.loading,
          ),
          GenreEvent(
            status: Status.empty,
          )
        ]));
    _genresBloc.getGenres();
  });

  test('The stream is empty when the bloc is disposed', () async {
    _genresBloc.dispose();
    bool empty = await _genresBloc.genresStream.isEmpty;
    expect(empty, true);
  });
}
