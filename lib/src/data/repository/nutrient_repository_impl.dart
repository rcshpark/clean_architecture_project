import 'package:health_care/src/data/data_sources/nutrient_data_source.dart';
import 'package:health_care/src/data/translator/translator.dart';
import 'package:health_care/src/domain/model/data_state_model.dart';
import 'package:health_care/src/domain/model/nutrient_model.dart';
import 'package:health_care/src/domain/repository/nutrient_repository.dart';

class NutrientRepositoryImpl implements NutrientRepository {
  final NutrientDataSource _nutrientDataSource;
  const NutrientRepositoryImpl(this._nutrientDataSource);

  @override
  Future<DataState<List<NutrientModel>>> searchNutrient(String query) async {
    try {
      final res = await _nutrientDataSource.searchNutrient(query);
      return Translator().translateNutrient(res);
    } catch (e) {
      return DataState.error(Exception(), e.toString());
    }
  }
}
