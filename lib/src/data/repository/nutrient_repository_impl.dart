import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/src/data/data_sources/nutrient_data_source.dart';
import 'package:health_care/src/data/translator/translator.dart';
import 'package:health_care/src/domain/model/data_state_model.dart';
import 'package:health_care/src/domain/model/nutrient_model.dart';
import 'package:health_care/src/domain/repository/nutrient_repository.dart';

final nutrientRepositoryProvider = Provider<NutrientRepositoryImpl>((ref) {
  return NutrientRepositoryImpl(ref);
});

class NutrientRepositoryImpl implements NutrientRepository {
  final Ref ref;
  NutrientRepositoryImpl(this.ref);

  @override
  Future<DataState<List<NutrientModel>>> searchNutrient(
      String query, int page) async {
    try {
      final res = await ref
          .read(nutrientDataSourceProvider)
          .searchNutrient(query, page);
      return Translator().translateNutrient(res);
    } catch (e) {
      return DataState.error(Exception(), e.toString());
    }
  }

  @override
  Future<DataState<List<NutrientModel>>> saveNutrient(
      List<NutrientModel> nutrients) async {
    try {
      final res =
          await ref.read(nutrientDataSourceProvider).saveNutrient(nutrients);
      return DataState.success(res);
    } catch (e) {
      return DataState.error(Exception('saved error'), e.toString());
    }
  }
}
