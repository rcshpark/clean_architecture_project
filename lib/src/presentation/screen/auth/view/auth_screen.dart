import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:health_care/src/domain/usecase/auth_usecase.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthUseCase _authUseCase = GetIt.I<AuthUseCase>();

  Future<void> _loginWithKakao() async {
    final user = await _authUseCase.call();
    user.when(success: (data) {
      print(data);
    }, error: (e, message) {
      print("e : $e");
      print("message : $message");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                _loginWithKakao();
              },
              child: const Text("kakao login"))
        ],
      ),
    );
  }
}
