import 'package:aksustack/screens/forget_password.dart';
import 'package:aksustack/screens/login_page.dart';
import 'package:aksustack/screens/onboarding_screen.dart';
import 'package:aksustack/screens/register_page.dart';
import 'package:aksustack/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Fiddle',
      theme: ThemeData(
      ),
      home: const LoginPage(),
    );
  }
}

