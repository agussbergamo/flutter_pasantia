import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_agustina/src/data/datasource/remote/api_service.dart';
import 'package:tmdb_agustina/src/data/models/genre_response.dart';
import 'package:tmdb_agustina/src/data/repositories/genre_repository.dart';
import 'package:tmdb_agustina/src/domain/entity/genre.dart';
import 'package:tmdb_agustina/src/domain/entity/response.dart';

class MockApiService extends Mock implements ApiService {}

void main() async {
  late GenreRepository _genreRepository;
  late ApiService _apiService;
  const String endpoint = 'https://api.themoviedb.org/3/genre/movie/list';

  setUp(() {
    _apiService = MockApiService();
    _genreRepository = GenreRepository(
      service: _apiService,
    );
  });

  test(
      'The method getGenres returns a ResponseSuccess instance when the call is successful',
      () async {
    List<Genre> genresList = [];
    Genre genre = Genre(
      id: 1,
      name: 'Adventure',
    );
    genresList.add(genre);
    GenreResponse genreResponse = GenreResponse(
      genres: genresList,
    );
    when(() => _apiService.getGenres(endpoint: endpoint))
        .thenAnswer((_) async => genreResponse);
    Response response = await _genreRepository.getGenres();
    expect(response, isInstanceOf<ResponseSuccess>());
  });

  test(
      'The method getGenres returns a ResponseError instance when the call fails',
      () async {
    when(() => _apiService.getGenres(endpoint: endpoint))
        .thenThrow(Exception());
    Response response = await _genreRepository.getGenres();
    expect(response, isInstanceOf<ResponseError>());
  });
}
