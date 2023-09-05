import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/repository/i_repository.dart';
import '../../domain/entity/genres_model.dart';

class GenreRepository implements IRepository<GenresModel> {
  @override
  Future<GenresModel> getModel() async {
    String jsonGenres = await rootBundle.loadString('assets/json/genres.json');
    List<dynamic> listGenres = jsonDecode(jsonGenres)['genres'];
    return GenresModel.fromJson(listGenres);
  }
}
