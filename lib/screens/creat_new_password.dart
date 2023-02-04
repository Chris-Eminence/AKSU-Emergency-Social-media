import 'package:flutter/material.dart';

import '../utils/project_colors.dart';
import 'home_page.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

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
                children: const [
                  Text(
                    'Create new Password 🗝 ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight / 29.4,),

            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Save the new password in a safe place, \nif you forget it then you have to do a \nforgot password again.',
                style: TextStyle(fontSize: 20.0, color: AppColors.black, height: 1.5),
              ),
            ),


            SizedBox(
              height: screenHeight / 29.43,
            ),

            // Registration Number

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
                  hintText: 'Create new password',
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
                  hintText: 'Comfirm your password',
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
                width: screenWidth,
                height: screenHeight / 14.7,
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
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF0E693E))),
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
