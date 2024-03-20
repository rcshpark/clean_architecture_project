import 'package:health_care/src/domain/model/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> loginWithKakao();
  Future<UserModel> loginWithApple();
}
