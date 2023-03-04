import 'package:aksustack/features/authentication/controllers/login_page_controller.dart';
import 'package:aksustack/repository/authentication_repo/authenticstion_repo.dart';
import 'package:aksustack/screens/forget_password/forget_password_mail/forget_password_with_mail.dart';
import 'package:aksustack/screens/home_page.dart';
import 'package:aksustack/utils/widgets/input_form_field.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/project_colors.dart';
import 'forget_password/forgot_password_options/forgot_password_btn_widget.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  void navigateToRegisterPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginInPageController());
    final _formKey = GlobalKey<FormState>();

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
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: InputTextFormFields(
                    controller: controller.email,
                    label: 'Email address',
                    prefixIcon: Icons.email,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /*
               Password Address TextField
                */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: InputTextFormFields(
                    controller: controller.password,
                    label: 'Password',
                    prefixIcon: Icons.password,
                    suffixIcon: Icons.visibility,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),

                /*
                FORGOT PASSWORD
                 */

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: TextButton(
                        onPressed: () {
                          /*
                          SHOW BOTTOM MODAL SHEET
                           */

                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            context: context,
                            builder: (context) => Container(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Make a selection...',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    'Select how you want to reset your password',
                                    style: TextStyle(
                                        color: AppColors.secondaryColor,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  /*
                                  CLICKABLE CONTAINER OPTIONS
                                   */

                                  //EMAIL OPTION
                                  forget_password_button(
                                      icon: Icons.email_outlined,
                                      title: 'E-mail',
                                      subtitle:
                                          'Reset password with E-mail Verification',
                                      onTap: () {
                                        Get.to(() => ForgetPasswordWithMail());
                                      }),
                                  // PHONE NUMBER OPTION
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  forget_password_button(
                                    icon: Icons.phone_enabled,
                                    title: 'Phone Number',
                                    subtitle:
                                        'Reset password with Phone Number Verification',
                                    onTap: () {},
                                  ),

                                  //
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10.0,
                ),

                /*
                Sign Up button
                 */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.05,
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : TextButton(
                            onPressed: () {
                              // Get.to(() => const Homepage());
                              AuthenticationRepository.instance
                                  .loginUserWithEmailAndPassword(
                                      controller.email.text.trim(),
                                      controller.password.text.trim());
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(60.0)),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF0E693E))),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 18.0),
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
                    children: [
                      const Text(
                        'Don\'t have an account yet? ',
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: navigateToRegisterPage,
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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
