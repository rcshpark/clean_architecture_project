import 'package:freezed_annotation/freezed_annotation.dart';
part 'nutrient_dto.freezed.dart';
part 'nutrient_dto.g.dart';

@freezed
class NutrientDto with _$NutrientDto {
  factory NutrientDto({
    required String name,
    required int kcal,
    required int carbohydrate,
    required int protein,
    required int fat,
  }) = _NutrientDto;

  factory NutrientDto.fromJson(Map<String, dynamic> json) =>
      _$NutrientDtoFromJson(json);
}
