import 'package:aksustack/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors/project_colors.dart';
import '../drop_down_spinners/drop_down.dart';
import 'sign_up_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Welcome Back - Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                      color: AppColors.greenColor,
                    ),
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
                        color: AppColors.greenColor,
                      ),
                      hintText: 'Reg number',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0.0,
                          style: BorderStyle.none,
                          color: AppColors.greenColor,
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
                        color: AppColors.greenColor,
                      ),
                      suffixIcon: const Icon(
                        Icons.visibility,
                        color: AppColors.greenColor,
                      ),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0.0,
                            style: BorderStyle.none,
                            color: AppColors.greenColor),
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

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0),
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
                                borderRadius: BorderRadius.circular(55.0)),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF0E693E))),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
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
                      Text('Don\'t have an account yet? '),
                      Text(
                        'Sign up',
                        style: TextStyle(
                            color: AppColors.greenColor,
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
