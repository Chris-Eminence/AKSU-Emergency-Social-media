import 'package:aksustack/features/authentication/controllers/otp_controller.dart';
import 'package:aksustack/utils/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            // child: Container(
            //   padding: const EdgeInsets.all(30),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const Text(
            //         'You have gotten a mail',
            //         style: TextStyle(
            //           fontSize: 30,
            //           color: AppColors.primaryColor,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       const SizedBox(height: 10,),
            //       const Text('We have sent the OTP verification code to \nyour email address. Check your email and \nenter the code below',
            //       ),
            //       const SizedBox(height: 20,),
            //       OtpTextField(
            //         onSubmit: (code){
            //
            //           // OTPController.instance.verifyOTP(otp);
            //         },
            //         fieldWidth: 50,
            //         fillColor: Colors.grey.shade400,
            //         filled: true,
            //         cursorColor: AppColors.primaryColor,
            //         numberOfFields: 6,
            //       ),
            //       const SizedBox(height: 20,),
            //       SizedBox(
            //         width: double.infinity,
            //         height: 50,
            //            child: TextButton(
            //           onPressed: (){
            //             // OTPController.instance.verifyOTP(otp);
            //           },
            //           style: ButtonStyle(
            //               shape: MaterialStateProperty.all(
            //                 RoundedRectangleBorder(
            //                     borderRadius:
            //                     BorderRadius.circular(60.0)),
            //               ),
            //               backgroundColor: MaterialStateProperty.all(
            //                   const Color(0xFF0E693E),),),
            //           child: const Text(
            //             'Next',
            //             style: TextStyle(
            //                 color: AppColors.white, fontSize: 18.0),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
