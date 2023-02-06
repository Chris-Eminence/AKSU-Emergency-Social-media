

import 'package:aksustack/screens/splash_screen/third_splash_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/project_colors.dart';

class SecondSplashScreen extends StatelessWidget {
  const SecondSplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // print("current width: " +
    //     MediaQuery.of(context).size.width.toInt().toString());
    // print("current height: " +
    //     MediaQuery.of(context).size.height.toInt().toString());

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight / 95,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    Text(
                      'Get in touch with',
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 36.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'an e-book experience',
                      style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 36.0,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Image(
                      image: AssetImage('images/onbording_image_three.png'),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      'Chat and engage with students and stay',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      'with the activities happening on the go',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                )
              ],
            ),
          ),
    );

  }
}
