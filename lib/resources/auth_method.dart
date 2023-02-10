import 'dart:typed_data';
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
    // required Uint8List profilePhoto,

  }) async {
    String result = 'Some error occurred';
    try {
      if (fullName.isNotEmpty || regNo.isNotEmpty || emailAddress.isNotEmpty ||
          phoneNumber.isNotEmpty || password.isNotEmpty ) {

        //registering User here
        UserCredential userCredential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: emailAddress, password: password);
        print(userCredential.user!.uid);

        //Storing user into database
        await  _firebaseFirestore.collection('users').doc(userCredential.user!.uid).set({
          'fullname' : fullName,
          'uid' : userCredential.user!.uid,
          'emailAddress' : emailAddress,
          'regNo' : regNo,
          'followers' : [],
          'following' : [],
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
    } catch (error) {
      result = error.toString();
    }
    return result;
  }
}