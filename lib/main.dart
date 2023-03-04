import 'package:aksustack/repository/authentication_repo/authenticstion_repo.dart';
import 'package:aksustack/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:aksustack/screens/register_page.dart';
import 'package:aksustack/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fiddle',
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}
