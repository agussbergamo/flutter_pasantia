import '../../domain/entity/genre.dart';

extension GenresUtils on List<int> {
  List<String> convertIntToString(List<Genre> genres) {
    return this
        .map((id) => genres.firstWhere((genre) => genre.id == id).name)
        .toList();
  }
}
