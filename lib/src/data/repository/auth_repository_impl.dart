import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_care/src/data/data_sources/auth_data_source.dart';
import 'package:health_care/src/domain/model/user_model.dart';
import 'package:health_care/src/domain/repository/auth_repository.dart';
import 'package:health_care/src/domain/usecase/auth_usecase.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;
  const AuthRepositoryImpl(this._authDataSource);
  @override
  Future<UserModel> loginWithKakao() async {
    final response = await _authDataSource.loginWithKakao();
    // UserModel userModel = response as UserModel;
    try {
      await _authDataSource.loginWithKakao();
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('회원정보');
      User user = await UserApi.instance.me();
      return UserModel(pk: 112, profile: "profile", age: 12, option: false);
    } catch (e) {
      print(e);
    }
    return response;
  }

  @override
  Future<UserModel> loginWithApple() async {
    return UserModel(pk: 321, profile: "2", age: 13, option: false);
  }
}
