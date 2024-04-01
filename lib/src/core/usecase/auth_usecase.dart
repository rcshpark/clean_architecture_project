import 'package:health_care/src/core/enum.dart';

abstract class UseCase<T, P> {
  Future<T> call(P params);
}

class AuthParam {
  final LoginType loginType;
  AuthParam({required this.loginType});
}
