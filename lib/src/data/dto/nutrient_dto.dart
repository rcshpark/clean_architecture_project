import 'package:freezed_annotation/freezed_annotation.dart';
part 'nutrient_dto.g.dart';

@JsonSerializable()
class NutrientDto {
  @JsonKey(name: 'DESC_KOR')
  String name;
  @JsonKey(name: 'NUTR_CONT1')
  String kcal;
  @JsonKey(name: 'NUTR_CONT2')
  String carbohydrate;
  @JsonKey(name: 'NUTR_CONT3')
  String protein;
  @JsonKey(name: 'NUTR_CONT4')
  String fat;

  NutrientDto(this.name, this.kcal, this.carbohydrate, this.protein, this.fat);

  factory NutrientDto.fromJson(Map<String, dynamic> json) =>
      _$NutrientDtoFromJson(json);
}
