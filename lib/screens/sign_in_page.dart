import 'package:aksustack/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/project_colors.dart';
import '../drop_down_spinners/drop_down.dart';
import 'sign_up_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Hello there 👋',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 50.0,
                ),
                // Image.asset(
                //   'images/login.png',
                //   height: 300.0,
                //   width: 300.0,
                // ),

                SizedBox(
                  height: size.height * 0.02,
                ),

                // Registration Number

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.app_registration_sharp,
                        color: AppColors.primaryColor,
                      ),
                      hintText: 'Reg number',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0.0,
                          style: BorderStyle.none,
                          color: AppColors.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),


                // Password Text Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.password,
                        color: AppColors.primaryColor,
                      ),
                      suffixIcon: const Icon(
                        Icons.visibility,
                        color: AppColors.primaryColor,
                      ),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0.0,
                            style: BorderStyle.none,
                            color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),


                SizedBox(
                  height: 60.0,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.05,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Homepage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60.0)),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF0E693E))),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: AppColors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Don\'t have an account yet? ', style: TextStyle(fontSize: 18),),
                      Text(
                        'Sign up',
                        style: TextStyle(fontSize: 18.0,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
