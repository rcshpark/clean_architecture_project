import 'package:health_care/src/core/usecase/usecase.dart';
import 'package:health_care/src/domain/model/data_state_model.dart';
import 'package:health_care/src/domain/model/nutrient_model.dart';
import 'package:health_care/src/domain/repository/nutrient_repository.dart';

class NutrientUseCase
    implements UseCase<DataState<List<NuterientModel>>, String> {
  final NutrientRepository _remoteRepository;

  NutrientUseCase(this._remoteRepository);

  @override
  Future<DataState<List<NuterientModel>>> call(String query) {
    return _remoteRepository.searchNutrient(query);
  }
}
