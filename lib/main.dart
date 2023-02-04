import 'package:aksustack/drop_down_spinners/drop_down.dart';
import 'package:aksustack/screens/creat_new_password.dart';
import 'package:aksustack/screens/home_page.dart';
import 'package:aksustack/screens/sign_in_page.dart';
import 'package:aksustack/screens/sign_up_page.dart';
import 'package:aksustack/screens/splash_screen/final_splash_screen.dart';
import 'package:aksustack/screens/splash_screen/first_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:aksustack/screens/splash_screen/splash_screen.dart';

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
      home: const CreateNewPassword(),
    );
  }
}

