import 'dart:math';
import 'dart:typed_data';
import 'package:aksustack/utils/storage_method.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationClass {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  // register user
  Future<String> registerUser({
    required String fullName,
    required String regNo,
    required String emailAddress,
    required String phoneNumber,
    required String password,
    // required String department,
    required Uint8List file,

  }) async {
    String result = 'Some error occurred';
    try {
      if (fullName.isNotEmpty || regNo.isNotEmpty || emailAddress.isNotEmpty ||
          phoneNumber.isNotEmpty || password.isNotEmpty) {

        /*
        Registering the user
         */
        UserCredential userCredential = await _firebaseAuth
            .createUserWithEmailAndPassword(
            email: emailAddress, password: password);


        String profilePhotoUrl = await StorageMethods().uploadImageToStorage(
            'profilePicture', file, false);

        print(userCredential.user!.uid);

        //Storing user into database
        await _firebaseFirestore.collection('users').doc(
            userCredential.user!.uid).set({
          'fullname': fullName,
          'uid': userCredential.user!.uid,
          'emailAddress': emailAddress,
          'regNo': regNo,
          'followers': [],
          'following': [],
          'phoneNo': phoneNumber,
          'photoUrl': profilePhotoUrl
          // 'department' : department,
          // 'profilePhotoUrl' : profilePhotoUrl
        });

        // using the auto generated user id from firebase
        // await  _firebaseFirestore.collection('users').add({
        //   'fullname' : fullName,
        //   'uid' : userCredential.user!.uid,
        //   'emailAddress' : emailAddress,
        //   'regNo' : regNo,
        //   'followers' : [],
        //   'following' : [],
        // });

        result = 'success';
      }
    } on FirebaseAuthException catch (auth_error) {
      if (auth_error.code == 'invalid-email') {
        result = 'the email is badly formatted';
      } else if (auth_error == 'weak-password') {
        result = 'Password should be at least 6 characters';
      }
    }
    catch (error) {
      result = error.toString();
    }
    return result;
  }


/*
Login in the user
 */

  Future<String> loginUser({
    required String email, required String password
  }) async {
    String result = "Some error occurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        result = "Login Successfully";
      }else{
        result = "Email or Password cannot be blank";
      }
    } catch (error) {
        error.toString();
    }
    return result;
  }
}