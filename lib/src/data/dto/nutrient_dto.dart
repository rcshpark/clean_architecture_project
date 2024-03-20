import 'package:freezed_annotation/freezed_annotation.dart';
part 'nutrient_dto.freezed.dart';
part 'nutrient_dto.g.dart';

@freezed
class NuterientDto with _$NuterientDto {
  factory NuterientDto({
    required String name,
    required int kcal,
    required int carbohydrate,
    required int protein,
    required int fat,
  }) = _NuterientDto;

  factory NuterientDto.fromJson(Map<String, dynamic> json) =>
      _$NuterientDtoFromJson(json);
}
