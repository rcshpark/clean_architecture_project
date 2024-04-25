abstract class NutrientUseCase<T, P> {
  Future<T> search(P params, P page);
  Future<T> save(P params);
}
