import 'dart:convert';

import 'package:flutter/services.dart';

import '../../core/util/string_constants.dart';
import '../../domain/entity/movie.dart';
import '../../domain/entity/response.dart';
import '../../domain/repository/i_movie_repository.dart';
import '../datasource/remote/api_service.dart';
import '../models/movie_response.dart';

class MovieRepository implements IMovieRepository<Movie> {
  final ApiService service;
  static const String assetRoute = 'assets/json/movies.json';

  const MovieRepository({
    required this.service,
  });

  String get baseUrl => '${StringConstants.baseUrl}movie/';

  @override
  Future<MovieResponse> getModel() async {
    String stringMovies = await rootBundle.loadString(assetRoute);
    Map<String, dynamic> jsonMovies = jsonDecode(stringMovies);
    return MovieResponse.fromJson(jsonMovies);
  }

  Future<Response> getMoviesByType(String endpoint) async {
    final MovieResponse response;
    try {
      response = await service.getMoviesByType(endpoint: '$baseUrl$endpoint');
      return ResponseSuccess(response);
    } catch (e) {
      return const ResponseError(StringConstants.moviesException);
    }
  }
}
