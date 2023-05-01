import 'dart:ffi';

import 'package:aksustack/features/authentication/controllers/register_page_controller.dart';
import 'package:aksustack/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:aksustack/utils/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/widgets/input_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterPageController());
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    'Register',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // fullName Input TextFields
                          InputTextFormFields(
                            controller: controller.fullname,
                            label: 'Enter full name',
                            prefixIcon: Icons.person,
                          ),

                          // Email Input TextFields
                          const SizedBox(height: 15),
                          InputTextFormFields(
                            controller: controller.email,
                            label: 'Enter email address',
                            prefixIcon: Icons.mail,
                          ),

                          // Email Input TextField
                          const SizedBox(height: 15),
                          InputTextFormFields(
                            controller: controller.phoneNumber,
                            label: 'Enter Phone Number',
                            prefixIcon: Icons.phone,
                            textInputType: TextInputType.phone,
                          ),

                          const SizedBox(height: 15),
                          InputTextFormFields(
                            controller: controller.department,
                            label: 'Enter Department',
                            prefixIcon: Icons.dashboard_customize,
                          ),

                          const SizedBox(height: 15),
                          InputTextFormFields(
                            controller: controller.regNo,
                            label: 'Enter Registration number',
                            prefixIcon: Icons.tag,
                          ),

                          const SizedBox(height: 15),
                          InputTextFormFields(
                            controller: controller.password,
                            label: 'Enter password',
                            prefixIcon: Icons.password,
                            obscurePassword: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  RegisterPageController.instance
                                      .registerUser(
                                    controller.email.text.trim(),
                                    controller.password.text.trim(),
                                    controller.fullname.text.trim(),
                                    controller.phoneNumber.text.trim(),
                                    controller.department.text.trim(),
                                    controller.regNo.text.trim(),
                                  );
                                }
                                Get.to(() => const OTPScreen());
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFF0E693E))),
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 18.0),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account? ',
                                  style: TextStyle(fontSize: 16),
                                ),
                                GestureDetector(
                                  onTap: () {

                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
