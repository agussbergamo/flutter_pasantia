import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_agustina/src/domain/entity/genre.dart';

void main() async {
  late Genre _mockGenre;

  setUp(() {
    _mockGenre = Genre(
      id: 1,
      name: 'Adventure',
    );
  });

  test('The method fromJson returns a Genre instance', () async {
    final Map<String, dynamic> jsonGenre = {
      'id': 1,
      'name': 'Adventure',
    };
    Genre genre = Genre.fromJson(jsonGenre);
    expect(genre, _mockGenre);
  });
}
