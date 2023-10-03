import 'package:flutter/material.dart';

import 'src/core/parameter/endpoint.dart';
import 'src/core/util/string_constants.dart';
import 'src/data/datasource/remote/api_service.dart';
import 'src/data/repositories/genre_repository.dart';
import 'src/data/repositories/movie_repository.dart';
import 'src/domain/usecase/implementation/get_genres_usecase.dart';
import 'src/domain/usecase/implementation/get_movies_usecase.dart';
import 'src/presentation/bloc/genres_bloc.dart';
import 'src/presentation/bloc/movies_bloc.dart';
import 'src/presentation/views/movie_detail.dart';
import 'src/presentation/views/movies_grid.dart';
import 'src/presentation/views/movies_list.dart';
import 'src/presentation/views/movies_pageview.dart';

void main() {
  const ApiService apiService = ApiService();
  const MovieRepository movieRepository = MovieRepository(
    service: apiService,
  );
  const GetMoviesUseCase moviesUseCase = GetMoviesUseCase(
    repository: movieRepository,
  );
  final MoviesBloc moviesBloc = MoviesBloc(
    moviesUseCase: moviesUseCase,
  );
  const GenreRepository genreRepository = GenreRepository(
    service: apiService,
  );
  const GetGenresUseCase genresUseCase = GetGenresUseCase(
    repository: genreRepository,
  );
  final GenresBloc genresBloc = GenresBloc(
    genresUseCase: genresUseCase,
  );

  runApp(
    MaterialApp(
      initialRoute: StringConstants.popularRouteName,
      routes: {
        StringConstants.popularRouteName: (context) => MoviesGrid(
              moviesBloc: moviesBloc,
              title: StringConstants.popularTitle,
              endpoint: Endpoint.popular,
            ),
        StringConstants.upcomingRouteName: (context) => MoviesGrid(
              moviesBloc: moviesBloc,
              title: StringConstants.upcomingTitle,
              endpoint: Endpoint.upcoming,
            ),
        StringConstants.topRatedRouteName: (context) => MoviesList(
              moviesBloc: moviesBloc,
              title: StringConstants.topRatedTitle,
              endpoint: Endpoint.topRated,
            ),
        StringConstants.nowPlayingRouteName: (context) => MoviesPageView(
              moviesBloc: moviesBloc,
              title: StringConstants.nowPlayingTitle,
              endpoint: Endpoint.nowPlaying,
            ),
        StringConstants.movieDetailRouteName: (context) => MovieDetail(
              genresBloc: genresBloc,
            ),
      },
    ),
  );
}
