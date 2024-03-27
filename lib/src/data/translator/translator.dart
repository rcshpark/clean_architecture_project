import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:health_care/src/data/dto/nutrient_dto.dart';
import 'package:health_care/src/data/dto/user_dto.dart';
import 'package:health_care/src/data/exception/translate_exception.dart';
import 'package:health_care/src/domain/model/data_state_model.dart';
import 'package:health_care/src/domain/model/nutrient_model.dart';
import 'package:health_care/src/domain/model/user_model.dart';

class Translator {
  static final Translator _singleton = Translator._internal();

  Translator._internal();

  factory Translator() => _singleton;

  Future<DataState<List<NutrientModel>>> translateNutrient(
    List<NutrientDto> nutrientInfo,
  ) {
    try {
      return compute(
        (List<NutrientDto> nutrientInfo) {
          var translated = nutrientInfo
              .map(
                (nutrient) => NutrientModel(
                  name: nutrient.name,
                  weight: double.parse(nutrient.weight),
                  kcal:
                      nutrient.kcal == "N/A" ? 0 : double.parse(nutrient.kcal),
                  carbohydrate: nutrient.carbohydrate == "N/A"
                      ? 0
                      : double.parse(nutrient.carbohydrate),
                  protein: nutrient.protein == "N/A"
                      ? 0
                      : double.parse(nutrient.protein),
                  fat: nutrient.fat == "N/A" ? 0 : double.parse(nutrient.fat),
                  sugars: nutrient.sugars == "N/A"
                      ? 0
                      : double.parse(nutrient.sugars),
                  na: nutrient.na == "N/A" ? 0 : double.parse(nutrient.na),
                  col: nutrient.col == "N/A" ? 0 : double.parse(nutrient.col),
                  saturatedFat: nutrient.saturatedFat == "N/A"
                      ? 0
                      : double.parse(nutrient.saturatedFat),
                  transFat: nutrient.transFat == "N/A"
                      ? 0
                      : double.parse(nutrient.transFat),
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

  Future<DataState<UserModel>> translateUser(
    UserDto userInfo,
  ) async {
    try {
      var translated = UserModel.fromJson(userInfo.toJson());
      return DataState.success(translated);
    } catch (error) {
      throw TranslateException(error.toString());
    }
  }
}
