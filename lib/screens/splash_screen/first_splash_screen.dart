import 'package:aksustack/utils/project_colors.dart';
import 'package:flutter/material.dart';

class FirstSplashScreen extends StatelessWidget {
  const FirstSplashScreen({Key? key}) : super(key: key);

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
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight /12.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Chat & engage',
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 36.0,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        'wherever, whenever',
                        style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 36.0,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Image(
                        height: screenHeight / 2.25, width: screenWidth /1.05,
                        image: const AssetImage('images/vic.png'),
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
          ),
        );
  }
}
