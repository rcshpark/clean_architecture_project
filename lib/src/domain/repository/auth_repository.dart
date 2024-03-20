import 'package:health_care/src/domain/model/data_state_model.dart';
import 'package:health_care/src/domain/model/user_model.dart';

abstract class AuthRepository {
  Future<DataState<UserModel>> loginWithKakao();
  Future<DataState<UserModel>> loginWithApple();
}
