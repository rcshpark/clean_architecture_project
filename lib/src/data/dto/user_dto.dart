import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  int pk;
  String profile;
  int age;
  bool option;
  UserDto(
      {required this.pk,
      required this.profile,
      required this.age,
      required this.option});

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
