// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      pk: json['pk'] as int,
      profile: json['profile'] as String,
      age: json['age'] as int,
      option: json['option'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'profile': instance.profile,
      'age': instance.age,
      'option': instance.option,
    };
