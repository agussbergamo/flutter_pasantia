abstract class IUseCase<T> {
  Future<T> call([Map<String, String>? params]);
}
