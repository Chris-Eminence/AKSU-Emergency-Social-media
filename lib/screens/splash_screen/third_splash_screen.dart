import 'package:flutter/material.dart';

import '../../utils/project_colors.dart';

class ThirdSplashScreen extends StatelessWidget {
  const ThirdSplashScreen({Key? key}) : super(key: key);

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
                        'Record and share',
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 36.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'on the go',
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
                        'Get notified when you are in trouble',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        'and things happening around you',
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

