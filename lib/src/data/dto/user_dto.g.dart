// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      pk: json['pk'] as int,
      profile: json['profile'] as String,
      age: json['age'] as int,
      option: json['option'] as bool,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'pk': instance.pk,
      'profile': instance.profile,
      'age': instance.age,
      'option': instance.option,
    };
