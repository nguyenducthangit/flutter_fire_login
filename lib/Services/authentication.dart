import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  // for storage data in cloud firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //for authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //for signup
  Future<String> SignUpUser(
      {required String email,
      required String name,
      required String password}) async {
    String res = "some error Occured";
    try {
      if (name.isNotEmpty || email.isNotEmpty || password.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // for addin user to ouser cloud firestore
        await _firestore.collection("user").doc(credential.user!.uid).set({
          'name': name,
          'email': email,
          'uid': credential.user!.uid,
        });
        res = "successfully";
        //for resister user in auth with email and password
      }
    } on FirebaseAuthException catch (e) {
      // print(e.toString());
      if (e.code == 'email-already-in-use') {
        res = "Email already in use. Please try another email.";
      } else if (e.code == 'invalid-email') {
        res = "The email address is badly formatted.";
      } else if (e.code == 'weak-password') {
        res = "The password provided is too weak.";
      } else {
        res = e.message ?? "An error occurred";
      }
    }
    return res;
  }
}
