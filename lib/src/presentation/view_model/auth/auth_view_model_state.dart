part of 'auth_view_model.dart';

abstract class AuthState {
  final UserModel? userModel;
  final String? error;
  const AuthState({this.userModel, this.error});
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  final UserModel userModel;

  AuthSuccess(this.userModel);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
