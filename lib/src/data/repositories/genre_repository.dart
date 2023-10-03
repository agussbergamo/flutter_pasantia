import 'dart:convert';

import 'package:flutter/services.dart';

import '../../core/util/string_constants.dart';
import '../../domain/entity/response.dart';
import '../../domain/repository/i_repository.dart';
import '../datasource/remote/api_service.dart';
import '../models/genre_response.dart';

class GenreRepository implements IRepository<GenreResponse> {
  final ApiService service;
  static const String baseUrl = StringConstants.baseUrl;
  static const String genresEndpoint = 'genre/movie/list';
  static const String assetRoute = 'assets/json/genres.json';

  const GenreRepository({
    required this.service,
  });

  @override
  Future<GenreResponse> getModel() async {
    String stringGenres = await rootBundle.loadString(assetRoute);
    Map<String, dynamic> jsonGenres = jsonDecode(stringGenres)['genres'];
    return GenreResponse.fromJson(jsonGenres);
  }

  Future<Response> getGenres() async {
    try {
      final GenreResponse response = await service.getGenres(
        endpoint: '$baseUrl$genresEndpoint',
      );
      return ResponseSuccess(response);
    } catch (e) {
      return const ResponseError(StringConstants.genresException);
    }
  }
}
