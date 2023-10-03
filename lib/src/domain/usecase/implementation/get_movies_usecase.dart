import '../../../data/repositories/movie_repository.dart';
import '../../entity/response.dart';
import '../i_usecase.dart';

class GetMoviesUseCase implements IUseCase {
  final MovieRepository repository;

  const GetMoviesUseCase({
    required this.repository,
  });

  @override
  Future<Response> call([Map<String, String>? params]) {
    return repository.getMoviesByType(params!['endpoint']!);
  }
}
