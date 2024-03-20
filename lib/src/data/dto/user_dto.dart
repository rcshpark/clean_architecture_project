import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  factory UserDto({
    required int pk,
    required String profile,
    required int age,
    required bool option,
  }) = _UserDto;
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
