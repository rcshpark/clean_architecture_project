// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NuterientDtoImpl _$$NuterientDtoImplFromJson(Map<String, dynamic> json) =>
    _$NuterientDtoImpl(
      name: json['name'] as String,
      kcal: json['kcal'] as int,
      carbohydrate: json['carbohydrate'] as int,
      protein: json['protein'] as int,
      fat: json['fat'] as int,
    );

Map<String, dynamic> _$$NuterientDtoImplToJson(_$NuterientDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kcal': instance.kcal,
      'carbohydrate': instance.carbohydrate,
      'protein': instance.protein,
      'fat': instance.fat,
    };
