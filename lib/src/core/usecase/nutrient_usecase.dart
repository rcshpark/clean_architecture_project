abstract class NutrientUseCase<T, P> {
  Future<T> search(P params);
  Future<T> save(P params);
}
