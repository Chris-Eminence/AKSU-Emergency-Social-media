import 'package:aksustack/screens/forget_password.dart';
import 'package:aksustack/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: const OnBoardingPage(),
    );
  }
}

