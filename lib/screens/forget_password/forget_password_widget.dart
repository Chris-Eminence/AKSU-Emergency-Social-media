import 'package:aksustack/screens/creat_new_password.dart';
import 'package:flutter/material.dart';
import '../../utils/project_colors.dart';

class ForgetPasswordWidget extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final IconData prefixIcon;
  final String editTextHint;
  final VoidCallback onPress;


  const ForgetPasswordWidget(
      {Key? key,
      required this.titleText,
      required this.subtitleText,
      required this.prefixIcon,
      required this.editTextHint, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Text(
                    titleText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight / 29.4,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                subtitleText,
                style: const TextStyle(
                    fontSize: 20.0, color: AppColors.black, height: 1.5),
              ),
            ),

            SizedBox(
              height: screenHeight / 29.43,
            ),

            // Registration Number

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    prefixIcon,
                    color: AppColors.primaryColor,
                  ),
                  hintText: editTextHint,
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
              height: screenHeight / 44.15,
            ),

            // Password Text Field

            const SizedBox(
              height: 60.0,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SizedBox(
                width: screenWidth,
                height: screenHeight / 14.7,
                child: TextButton(
                  onPressed: onPress,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor)),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: AppColors.white, fontSize: 24.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
