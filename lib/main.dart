import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/firebase_options.dart';
import 'package:health_care/src/injector.dart';
import 'package:health_care/src/presentation/screen/auth/view/auth_screen.dart';
import 'package:health_care/src/presentation/screen/home/view/home_view.dart';
import 'package:health_care/src/presentation/screen/nutrient/view/nutrient_search_view.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  KakaoSdk.init(nativeAppKey: dotenv.env["KAKAO_NATIVE_APP_KEY"]);
  setupInjector();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
