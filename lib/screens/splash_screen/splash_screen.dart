import 'package:aksustack/screens/onboarding_screen.dart';
import 'package:aksustack/screens/register_page.dart';
import 'package:aksustack/screens/splash_screen/second_splash_screen.dart';
import 'package:flutter/material.dart';

import 'first_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Center(
                  child: Image(
                    image: AssetImage('images/aksu_logo.png'),
                    width: 180.0,
                    height: 180.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100.0),
                  child: Text('Akwa Ibom',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 36.0,
                        color: const Color(0xFF0E693E),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100.0),
                  child: Text('State University',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 36.0,
                        color: const Color(0xFF0E693E),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100.0),
                  child: Text('SafeZone',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 36.0,
                        color: Color(0xFF0E693E),
                      )),
                ),
                const SizedBox(
                  height: 67.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(image: AssetImage('images/facebook.png')),
                    SizedBox(
                      width: 24.0,
                    ),
                    Image(image: AssetImage('images/twitter.png')),
                    SizedBox(
                      width: 24.0,
                    ),
                    Image(image: AssetImage('images/instagram.png')),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 150.0,
            ),
            Positioned(
                bottom: 0.0,
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100.0),
                      child: Text('App developed by Hachstacks ',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100.0),
                      child: Text('Copyright 2023',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
