import 'dart:convert';

import 'package:flutter/services.dart';

import '../interfaces/i_repository.dart';
import '../models/genres_model.dart';

class GenreRepository implements IRepository<GenresModel> {
  @override
  Future<GenresModel> getModel() async {
    String jsonGenres = await rootBundle.loadString('assets/json/genres.json');
    List<dynamic> listGenres = jsonDecode(jsonGenres)['genres'];
    return GenresModel.fromJson(listGenres);
  }
}
