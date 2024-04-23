// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutrientModelImpl _$$NutrientModelImplFromJson(Map<String, dynamic> json) =>
    _$NutrientModelImpl(
      name: json['name'] as String,
      weight: (json['weight'] as num).toDouble(),
      kcal: (json['kcal'] as num).toDouble(),
      carbohydrate: (json['carbohydrate'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      fat: (json['fat'] as num).toDouble(),
      sugars: (json['sugars'] as num).toDouble(),
      na: (json['na'] as num).toDouble(),
      col: (json['col'] as num).toDouble(),
      saturatedFat: (json['saturatedFat'] as num).toDouble(),
      transFat: (json['transFat'] as num).toDouble(),
      company: json['company'] as String,
    );

Map<String, dynamic> _$$NutrientModelImplToJson(_$NutrientModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
      'kcal': instance.kcal,
      'carbohydrate': instance.carbohydrate,
      'protein': instance.protein,
      'fat': instance.fat,
      'sugars': instance.sugars,
      'na': instance.na,
      'col': instance.col,
      'saturatedFat': instance.saturatedFat,
      'transFat': instance.transFat,
      'company': instance.company,
    };
