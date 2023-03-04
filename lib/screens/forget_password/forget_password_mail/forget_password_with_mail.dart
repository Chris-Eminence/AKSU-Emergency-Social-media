import 'package:aksustack/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:aksustack/screens/forget_password/forget_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordWithMail extends StatelessWidget {
  const ForgetPasswordWithMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ForgetPasswordWidget(
      titleText: 'Forgot password with mail?',
      subtitleText: 'Enter your email to reset password',
      prefixIcon: Icons.email_outlined,
      editTextHint: 'email address',
      onPress: (){
        Get.to(() => OTPScreen());
      },
    );
  }
}
