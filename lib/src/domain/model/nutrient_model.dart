import 'package:freezed_annotation/freezed_annotation.dart';
part 'nutrient_model.freezed.dart';
part 'nutrient_model.g.dart';

@freezed
class NuterientModel with _$NuterientModel {
  factory NuterientModel({
    required String name,
    required int kcal,
    required int carbohydrate,
    required int protein,
    required int fat,
  }) = _NuterientModel;

  factory NuterientModel.fromJson(Map<String, dynamic> json) =>
      _$NuterientModelFromJson(json);
}
