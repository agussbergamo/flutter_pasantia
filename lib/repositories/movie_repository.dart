import 'dart:convert';

import 'package:flutter/services.dart';

import '../interfaces/i_repository.dart';
import '../models/movies_model.dart';

class MovieRepository implements IRepository<MoviesModel> {
  @override
  Future<MoviesModel> getModel() async {
    String jsonMovies = await rootBundle.loadString('assets/json/movies.json');
    List<dynamic> listMovies = jsonDecode(jsonMovies);
    return MoviesModel.fromJson(listMovies);
  }
}
