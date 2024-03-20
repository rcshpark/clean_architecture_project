import 'package:health_care/src/core/usecase/usecase.dart';
import 'package:health_care/src/domain/model/user_model.dart';
import 'package:health_care/src/domain/repository/auth_repository.dart';

class AuthUseCase implements UseCase<UserModel> {
  final AuthRepository _remoteRepository;

  AuthUseCase(this._remoteRepository);

  @override
  Future<UserModel> call() {
    return _remoteRepository.loginWithKakao();
  }
}
