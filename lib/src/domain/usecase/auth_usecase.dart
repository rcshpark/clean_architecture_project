import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/src/core/enum.dart';
import 'package:health_care/src/core/usecase/auth_usecase.dart';
import 'package:health_care/src/data/repository/auth_repository_impl.dart';
import 'package:health_care/src/domain/model/data_state_model.dart';
import 'package:health_care/src/domain/model/user_model.dart';
import 'package:health_care/src/domain/repository/auth_repository.dart';

final authUseCaseProvider = Provider<AuthUseCase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthUseCase(authRepository);
});

class AuthUseCase implements UseCase<DataState<UserModel>, AuthParam> {
  final AuthRepository _remoteRepository;
  AuthUseCase(this._remoteRepository);

  @override
  Future<DataState<UserModel>> call(AuthParam authParam) {
    switch (authParam.loginType) {
      case LoginType.kakao:
        return _remoteRepository.loginWithKakao();
      case LoginType.apple:
        return _remoteRepository.loginWithApple();
      default:
        throw UnimplementedError("Login type not supported");
    }
  }
}
