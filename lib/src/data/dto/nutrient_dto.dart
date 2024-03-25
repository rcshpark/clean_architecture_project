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
  @JsonKey(name: 'NUTR_CONT5')
  String sugars;
  @JsonKey(name: 'NUTR_CONT6')
  String na;
  @JsonKey(name: 'NUTR_CONT7')
  String col;
  @JsonKey(name: 'NUTR_CONT8')
  String saturatedFat;
  @JsonKey(name: 'NUTR_CONT9')
  String transFat;
  NutrientDto(this.name, this.kcal, this.carbohydrate, this.protein, this.fat,
      this.sugars, this.na, this.col, this.saturatedFat, this.transFat);

  factory NutrientDto.fromJson(Map<String, dynamic> json) =>
      _$NutrientDtoFromJson(json);
}
