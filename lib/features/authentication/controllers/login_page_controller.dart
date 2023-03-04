import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repo/authenticstion_repo.dart';

class LoginInPageController extends GetxController{
  static LoginInPageController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser(
      String email,
      String password,

      ) {
    String? error = AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password) as String;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
      return;
    }
  }

}