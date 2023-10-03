import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_agustina/src/data/datasource/remote/api_service.dart';
import 'package:tmdb_agustina/src/data/models/movie_response.dart';
import 'package:tmdb_agustina/src/data/repositories/movie_repository.dart';
import 'package:tmdb_agustina/src/domain/entity/movie.dart';
import 'package:tmdb_agustina/src/domain/entity/response.dart';

class MockApiService extends Mock implements ApiService {}

void main() async {
  late MovieRepository _movieRepository;
  late ApiService _apiService;
  const String apiEndpoint = 'https://api.themoviedb.org/3/movie/popular';
  const String repositoryEndpoint = 'popular';

  setUp(() {
    _apiService = MockApiService();
    _movieRepository = MovieRepository(
      service: _apiService,
    );
  });

  test(
      'The method getMoviesByType returns a ResponseSuccess instance when the call is successful',
      () async {
    List<Movie> moviesList = [];
    moviesList.add(Movie.mockMovie());
    MovieResponse movieResponse = MovieResponse(
      results: moviesList,
      page: 1,
      totalPages: 1,
      totalResult: 1,
    );
    when(() => _apiService.getMoviesByType(endpoint: apiEndpoint))
        .thenAnswer((_) async => movieResponse);
    Response response =
        await _movieRepository.getMoviesByType(repositoryEndpoint);
    expect(response, isInstanceOf<ResponseSuccess>());
  });

  test(
      'The method getPopular returns a ResponseError instance when the call fails',
      () async {
    when(() => _apiService.getMoviesByType(endpoint: apiEndpoint))
        .thenThrow(Exception());
    Response response =
        await _movieRepository.getMoviesByType(repositoryEndpoint);
    expect(response, isInstanceOf<ResponseError>());
  });
}
