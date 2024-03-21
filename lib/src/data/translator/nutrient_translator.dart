import 'package:flutter/foundation.dart';
import 'package:health_care/src/data/dto/nutrient_dto.dart';
import 'package:health_care/src/data/exception/translate_exception.dart';
import 'package:health_care/src/domain/model/data_state_model.dart';
import 'package:health_care/src/domain/model/nutrient_model.dart';

class NutrientTranslator {
  static final NutrientTranslator _singleton = NutrientTranslator._internal();

  NutrientTranslator._internal();

  factory NutrientTranslator() => _singleton;

  Future<DataState<List<NuterientModel>>> translateNutrient(
    List<NutrientDto> nutrientInfo,
  ) {
    try {
      return compute(
        (List<NutrientDto> nutrientInfo) {
          var translated = nutrientInfo
              .map(
                (nutrient) => NuterientModel(
                  name: nutrient.name,
                  kcal: nutrient.kcal,
                  carbohydrate: nutrient.carbohydrate,
                  protein: nutrient.protein,
                  fat: nutrient.fat,
                ),
              )
              .toList();

          return DataState.success(
            translated,
          );
        },
        nutrientInfo,
      );
    } catch (error) {
      throw TranslateException(error.toString());
    }
  }
}
