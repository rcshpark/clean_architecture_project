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
                  kcal: double.parse(nutrient.kcal).toInt(),
                  carbohydrate: double.parse(nutrient.carbohydrate).toInt(),
                  protein: double.parse(nutrient.protein).toInt(),
                  fat: double.parse(nutrient.fat).toInt(),
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
