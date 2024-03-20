import 'package:flutter/material.dart';
import 'package:health_care/src/data/repository/auth_repository_impl.dart';
import 'package:health_care/src/domain/repository/auth_repository.dart';
import 'package:health_care/src/domain/usecase/auth_usecase.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                // AuthUseCase().call();
              },
              child: const Text("kakao login"))
        ],
      ),
    );
  }
}
