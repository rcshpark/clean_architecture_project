import 'package:health_care/src/data/data_sources/auth_data_source.dart';
import 'package:health_care/src/data/translator/translator.dart';
import 'package:health_care/src/domain/model/data_state_model.dart';
import 'package:health_care/src/domain/model/user_model.dart';
import 'package:health_care/src/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;
  const AuthRepositoryImpl(this._authDataSource);
  @override
  Future<DataState<UserModel>> loginWithKakao() async {
    try {
      final res = await _authDataSource.loginWithKakao();
      print(res.toString());
      return Translator().translateUser(res);
    } catch (e) {
      print(e);
      return DataState.error(Exception(), e.toString());
    }
  }

  @override
  Future<DataState<UserModel>> loginWithApple() async {
    var t = UserModel(pk: 321, profile: "2", age: 13, option: false);
    return DataState.success(t);
  }
}
