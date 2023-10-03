import '../../../data/repositories/genre_repository.dart';
import '../../entity/response.dart';
import '../i_usecase.dart';

class GetGenresUseCase implements IUseCase {
  final GenreRepository repository;

  const GetGenresUseCase({
    required this.repository,
  });

  @override
  Future<Response> call([Map<String, String>? params]) {
    return repository.getGenres();
  }
}
