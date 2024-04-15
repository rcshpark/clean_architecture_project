import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:health_care/src/core/enum.dart';
import 'package:health_care/src/core/usecase/auth_usecase.dart';
import 'package:health_care/src/domain/model/user_model.dart';
import 'package:health_care/src/domain/usecase/auth_usecase.dart';
import 'package:health_care/src/presentation/screen/nutrient/view/nutrient_search_view.dart';

part 'auth_view_model_state.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  final authUsecase = ref.watch(authUseCaseProvider);
  return AuthViewModel(authUsecase);
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;

  AuthViewModel(this._authUseCase) : super(const AuthInitial());

  Future<void> login(LoginType loginType, BuildContext context) async {
    state = const AuthLoading();
    final result = await _authUseCase(AuthParam(loginType: loginType));
    result.when(
      success: (userModel) {
        state = AuthSuccess(userModel);
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => NutrientSearchScreen())));
      },
      error: (e, message) => state = AuthError(e.toString()),
    );
  }
}
