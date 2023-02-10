import 'package:aksustack/screens/login_page.dart';
import 'package:aksustack/screens/register_page.dart';
import 'package:flutter/material.dart';

import '../../utils/project_colors.dart';

class FinalSplashScreen extends StatelessWidget {
  const FinalSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("current width: " +
    //     MediaQuery.of(context).size.width.toInt().toString());
    // print("current height: " +
    //     MediaQuery.of(context).size.height.toInt().toString());

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight / 95,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    Image(
                      image: AssetImage('images/onbording_image_three.png'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 83.0),
                      child: SizedBox(
                        width: screenWidth,
                        height: screenHeight  / 16.9,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                                )
                            );
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(5.0),
                              shadowColor: MaterialStateProperty.all(AppColors.primaryColorShade),

                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60.0)),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.primaryColor)),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: AppColors.white, fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight / 40.9,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 83.0),
                      child: SizedBox(
                        width: screenWidth,
                        height: screenHeight  / 16.9,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => LoginPage(),
                            ));
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(5.0),
                              shadowColor: MaterialStateProperty.all(AppColors.primaryColorShade),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60.0)),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.white)),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: AppColors.primaryColor, fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'By signing in, you accept our ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      'Terms and Conditions',
                      style: TextStyle(fontSize: 18.0, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
