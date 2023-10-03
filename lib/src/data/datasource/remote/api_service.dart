import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../core/util/string_constants.dart';
import '../../models/genre_response.dart';
import '../../models/movie_response.dart';
import 'i_api_service.dart';

class ApiService implements IApiService {
  static const String _apiKey = '?api_key=';
  static const String _apiKeyValue = '025aa98c350d497beb053d9b5e169637';

  const ApiService();

  @override
  Future<MovieResponse> getMoviesByType({required String endpoint}) async {
    final response =
        await http.get(Uri.parse('$endpoint$_apiKey$_apiKeyValue'));
    if (response.statusCode == HttpStatus.ok) {
      return MovieResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(StringConstants.moviesException);
    }
  }

  @override
  Future<GenreResponse> getGenres({required String endpoint}) async {
    final response =
        await http.get(Uri.parse('$endpoint$_apiKey$_apiKeyValue'));
    if (response.statusCode == HttpStatus.ok) {
      return GenreResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(StringConstants.genresException);
    }
  }
}
