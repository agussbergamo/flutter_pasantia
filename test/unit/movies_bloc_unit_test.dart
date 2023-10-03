import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_agustina/src/core/parameter/endpoint.dart';
import 'package:tmdb_agustina/src/core/parameter/status.dart';
import 'package:tmdb_agustina/src/data/models/movie_response.dart';
import 'package:tmdb_agustina/src/domain/entity/movie.dart';
import 'package:tmdb_agustina/src/domain/entity/movie_event.dart';
import 'package:tmdb_agustina/src/domain/entity/response.dart';
import 'package:tmdb_agustina/src/domain/usecase/implementation/get_movies_usecase.dart';
import 'package:tmdb_agustina/src/presentation/bloc/movies_bloc.dart';

class MockGetMoviesUseCase extends Mock implements GetMoviesUseCase {}

void main() async {
  late GetMoviesUseCase _getMoviesUseCase;
  late MoviesBloc _moviesBloc;
  const Endpoint endpoint = Endpoint.popular;

  setUp(() {
    _getMoviesUseCase = MockGetMoviesUseCase();
    _moviesBloc = MoviesBloc(
      moviesUseCase: _getMoviesUseCase,
    );
  });

  test('The method getMoviesByType adds MovieEvent instances to the stream',
      () async {
    when(() => _getMoviesUseCase.call(<String, String>{'endpoint': '${endpoint.name}'}))
        .thenAnswer((_) async => const ResponseError('Error'));
    _moviesBloc.getMoviesByType(endpoint);
    _moviesBloc.moviesStream.listen(expectAsync1((event) {
      expect(event, isInstanceOf<MovieEvent>());
    }));
  });

  test(
      'The method getMoviesByType creates a MovieEvent with status error and an error message when the call fails',
      () async {
    when(() => _getMoviesUseCase.call(<String, String>{'endpoint': '${endpoint.name}'}))
        .thenAnswer((_) async => const ResponseError('Error'));
    expect(
        _moviesBloc.moviesStream,
        emitsInOrder([
          MovieEvent(
            status: Status.loading,
          ),
          MovieEvent(
            status: Status.error,
            errorMsg: 'Error',
          )
        ]));
    _moviesBloc.getMoviesByType(endpoint);
  });

  test(
      'The method getMoviesByType creates a MovieEvent with status success and movies data when the call is successful',
      () async {
    List<Movie> moviesList = [];
    moviesList.add(Movie.mockMovie());
    MovieResponse movieResponse = MovieResponse(
      results: moviesList,
      page: 1,
      totalPages: 1,
      totalResult: 1,
    );
    when(() => _getMoviesUseCase.call(any()))
        .thenAnswer((_) async => ResponseSuccess(movieResponse));
    expectLater(
        _moviesBloc.moviesStream,
        emitsInOrder([
          MovieEvent(
            status: Status.loading,
          ),
          MovieEvent(
            status: Status.success,
            moviesList: movieResponse.results,
          )
        ]));
    _moviesBloc.getMoviesByType(endpoint);
  });

  test(
      'The method getMoviesByType creates a MovieEvent with status empty when the call is successful but there is no data',
      () async {
    List<Movie> moviesList = [];
    MovieResponse movieResponse = MovieResponse(
      results: moviesList,
      page: 0,
      totalPages: 0,
      totalResult: 0,
    );
    when(() => _getMoviesUseCase.call(any()))
        .thenAnswer((_) async => ResponseSuccess(movieResponse));
    expectLater(
        _moviesBloc.moviesStream,
        emitsInOrder([
          MovieEvent(
            status: Status.empty,
          )
        ]));
    _moviesBloc.getMoviesByType(endpoint);
  });

  test('The stream is empty when the bloc is disposed', () async {
    _moviesBloc.dispose();
    bool empty = await _moviesBloc.moviesStream.isEmpty;
    expect(empty, true);
  });
}
