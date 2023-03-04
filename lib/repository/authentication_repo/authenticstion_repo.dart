import 'package:aksustack/repository/exceptions/register_up_email_and_password_exception.dart';
import 'package:aksustack/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../screens/splash_screen/splash_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables related to firebase
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  // This functions is called up when the app is launched to check the user state(Signed in or new user) using fireBaseUser
  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const SplashScreen())
        : Get.offAll(() => const Homepage());
  }

  //--  REGISTER FUNCTION
  Future<void> createUserWithEmailAndPassword(String email,
      String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // firebaseUser.value != null
      //     ? Get.offAll(() => const Homepage())
      //     : Get.offAll(() => const SplashScreen());
    } on FirebaseAuthException catch (e) {
      final exception = RegisterEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${exception.message}');
      throw exception;
    } catch (_) {
      const exception = RegisterEmailAndPasswordFailure();
      print('EXCEPTION - ${exception.message}');
      throw exception;
    }
  }

  //-- LOGIN FUNCTION
  Future<void> loginUserWithEmailAndPassword(String email,
      String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {} catch (_) {}
  }

  //--  LOGOUT FUNCTION
  Future<void> logout() async => await _auth.signOut();

  //-- PHONE NUMBER AUTHENTICATION
  Future<void> phoneNumberAuthentication(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The phone number is invalid');
        } else {
          Get.snackbar('Error', 'Something went wrong, Try again');
        }
      },

    );
  }

  // VERIFY USER THROUGH PHONE AUTHENTICATION
  // Future<bool> verifyOTP(String otp) async {
  //   var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(
  //       verificationId: verificationId.value, smsCode: otp));
  //    return credentials.user != null ? true : false;
  // }
}
