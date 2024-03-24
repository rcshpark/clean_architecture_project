import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care/src/core/enum.dart';
import 'package:health_care/src/presentation/screen/nutrient/view/nutrient_detail_view.dart';
import 'package:health_care/src/presentation/view_model/auth/auth_view_model.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    final authViewModel = ref.watch(authViewModelProvider.notifier);

    return Scaffold(body: authBody(authState, authViewModel, context));
  }
}

Widget authBody(
    AuthState authState, AuthViewModel authViewModel, BuildContext context) {
  if (authState is AuthError) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Fluttertoast.showToast(msg: "login error : ${authState.message}");
    });
  } else if (authState is AuthSuccess) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NutrientDetailScreen()));
    });
  } else if (authState is AuthLoading) {
    return const Center(child: CircularProgressIndicator());
  }
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () => authViewModel.login(LoginType.kakao, context),
            child: const Text("Kakao Login")),
        ElevatedButton(
            onPressed: () => authViewModel.login(LoginType.apple, context),
            child: const Text("Apple Login")),
      ],
    ),
  );
}
