// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      pk: json['pk'] as int,
      profile: json['profile'] as String,
      age: json['age'] as int,
      option: json['option'] as bool,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'profile': instance.profile,
      'age': instance.age,
      'option': instance.option,
    };
