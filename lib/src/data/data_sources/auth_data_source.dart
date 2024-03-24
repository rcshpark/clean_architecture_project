import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:health_care/src/data/dto/user_dto.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class AuthDataSource {
  Future<UserDto> loginWithKakao() async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          throw Exception(error.code);
        }
        try {
          await UserApi.instance.loginWithKakaoAccount();
        } catch (error) {
          throw Exception(error);
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
      } catch (error) {
        throw Exception(error);
      }
    }
    User user = await UserApi.instance.me();
    var userDto = UserDto(
        pk: user.id,
        profile: user.kakaoAccount!.profile!.nickname ?? "",
        age: 12,
        option: false);
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('회원정보');

      collectionRef.add(userDto.toJson());
    } catch (e) {
      throw Exception(e);
    }
    return userDto;
  }
}
