abstract class IRepository<T> {
  Future<T> getModel();
}
