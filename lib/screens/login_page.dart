import 'package:aksustack/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resources/auth_method.dart';
import '../utils/image_utils.dart';
import '../utils/project_colors.dart';
import '../drop_down_spinners/drop_down.dart';
import '../utils/widgets/text_input_field.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailAddressTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailAddressTextController.dispose();
    _passwordTextController.dispose();
  }

  void loginUser() async {
    String result = await AuthenticationClass().loginUser(
        email: _emailAddressTextController.text,
        password: _passwordTextController.text);

    if (result == "success") {

    }else {
      showSnackBar(result, context);
    }
  }

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

               /*
               Email Address TextField
                */

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextInputWidget(
                      textEditingController: _emailAddressTextController,
                      hintText: 'Email address',
                      prefixIcon: const Icon(
                        Icons.email,
                        color: AppColors.primaryColor,
                      ),
                      textInputType: TextInputType.emailAddress),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /*
               Password Address TextField
                */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextInputWidget(
                    obscureText: true,
                    textEditingController: _passwordTextController,
                    hintText: 'password',
                    prefixIcon: const Icon(
                      Icons.password,
                      color: AppColors.primaryColor,
                    ),
                    suffixIcon: const Icon(Icons.visibility),
                    textInputType: TextInputType.visiblePassword,
                  ),
                ),

                const SizedBox(
                  height: 60.0,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.05,
                    child: TextButton(
                      onPressed: loginUser,
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
