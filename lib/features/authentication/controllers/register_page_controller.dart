import 'package:aksustack/repository/authentication_repo/authenticstion_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  static RegisterPageController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNumber = TextEditingController();
  final department = TextEditingController();
  final regNo = TextEditingController();

  // function will be call from the design
  void registerUser(
    String email,
    String password,
    String fullname,
    String phoneNumber,
    String? department,
    String regNo,
  ) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
      return;
    }
  }

  // Get Phone number from user and pass it to auth repository for authentication
  // void phoneAuthentication(String phoneNumber) {
  //   AuthenticationRepository.instance.phoneNumberAuthentication(phoneNumber);

  // }
}
