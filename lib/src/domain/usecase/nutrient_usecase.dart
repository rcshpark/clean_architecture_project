import 'package:health_care/src/core/usecase/%08nutrient_usecase.dart';
import 'package:health_care/src/domain/model/data_state_model.dart';
import 'package:health_care/src/domain/model/nutrient_model.dart';
import 'package:health_care/src/domain/repository/nutrient_repository.dart';

class RemoteNutrientUseCase
    implements NutrientUseCase<DataState<List<NutrientModel>>, dynamic> {
  final NutrientRepository _remoteRepository;

  RemoteNutrientUseCase(this._remoteRepository);

  @override
  Future<DataState<List<NutrientModel>>> search(dynamic params) {
    return _remoteRepository.searchNutrient(params);
  }

  @override
  Future<DataState<List<NutrientModel>>> save(dynamic params) {
    return _remoteRepository.saveNutrient(params);
  }
}
