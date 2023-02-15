import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageMethods{
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //-- adding image to firebase storage

    Future<String> uploadImageToStorage(String childName, Uint8List file, bool isPost) async {
      Reference profilePictureRef = _storage.ref().child(childName).child(_auth.currentUser!.uid);

      UploadTask uploadTaskProfilePicture = profilePictureRef.putData(file);

      TaskSnapshot profilePictureSnap = await uploadTaskProfilePicture;
      String profilePictureDownloadUrl = await profilePictureSnap.ref.getDownloadURL();

      return profilePictureDownloadUrl;
    }
}