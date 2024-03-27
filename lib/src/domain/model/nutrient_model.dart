import 'package:freezed_annotation/freezed_annotation.dart';
part 'nutrient_model.freezed.dart';
part 'nutrient_model.g.dart';

@freezed
class NutrientModel with _$NutrientModel {
  factory NutrientModel({
    required String name,
    required double weight,
    required double kcal,
    required double carbohydrate,
    required double protein,
    required double fat,
    required double sugars,
    required double na,
    required double col,
    required double saturatedFat,
    required double transFat,
  }) = _NutrientModel;

  factory NutrientModel.fromJson(Map<String, dynamic> json) =>
      _$NutrientModelFromJson(json);
}
