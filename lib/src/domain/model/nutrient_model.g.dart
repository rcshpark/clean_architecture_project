// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NuterientModelImpl _$$NuterientModelImplFromJson(Map<String, dynamic> json) =>
    _$NuterientModelImpl(
      name: json['name'] as String,
      kcal: json['kcal'] as int,
      carbohydrate: json['carbohydrate'] as int,
      protein: json['protein'] as int,
      fat: json['fat'] as int,
    );

Map<String, dynamic> _$$NuterientModelImplToJson(
        _$NuterientModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kcal': instance.kcal,
      'carbohydrate': instance.carbohydrate,
      'protein': instance.protein,
      'fat': instance.fat,
    };
