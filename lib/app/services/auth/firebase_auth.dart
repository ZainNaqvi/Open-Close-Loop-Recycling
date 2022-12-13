import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_button.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_snake_bar.dart';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html' as html;
import '../../model/user_model.dart';

class DbHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

// for the provider
  Future<UserCreditials> getUserDetails() async {
    // getting the current user by firebase auth
    User currentUser = _auth.currentUser!;

    //getting the data

    DocumentSnapshot snapshot = await _firebaseFirestore
        .collection("user")
        .doc(currentUser.uid)
        .get()
        .catchError(
      (onError) {
        print(onError);
      },
    );

    return UserCreditials.fromSnap(snapshot);
  }
  // Creating the function which is responsible for the auth related work

  // creating - the -  function - to - create - the - user
  Future<String> createUser(
      {required String name,
      required String email,
      required String password}) async {
    String res = "Some error Occured";
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Getting - Response - Firebase - Auth

      print(userCredential.user!.uid);
      UserCreditials userData = UserCreditials(
        email: email,
        uid: userCredential.user!.uid,
        name: name,
      );
      // Sending - Email -  Verification
      await sendVerification();
      // Creating - Firebase - Firestore - Collection (' user ') & Setting - Values
      await _firebaseFirestore
          .collection("user")
          .doc(userCredential.user!.uid)
          .set(
            userData.toJson(),
          );
      res = "success";
    } on FirebaseAuthException catch (err) {
      if (err.code == 'weak-password') {
        GenericSnackBar(text: "The password provided is too weak.");
      } else if (err.code == 'email-already-in-use') {
        GenericSnackBar(text: "The account already exists for that email.");
      } else if (err.code == 'timeout') {
        GenericSnackBar(text: 'The operation has timed out.');
      }
    }
    return res;
  }

// Email Verification
  Future<String> sendVerification() async {
    String res = "Some error occured";
    try {
      _auth.currentUser!.sendEmailVerification();
      GenericSnackBar(text: "Email Verification code is send to your email.");

      res = "success";
    } on FirebaseException catch (e) {
      GenericSnackBar(text: "Some error occured");
    }
    return res;
  }

  // login
  Future<String> userLogin({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured.";
    // checking the values are empty or not
    try {
      // now checking and login the user
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await _auth.currentUser!.sendEmailVerification();
        // const url = "https://mail.google.com/";
        // html.window.open(url, "Gmail.com");
        GenericSnackBar(text: "Please verify the email first.");
      } else {
        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        GenericSnackBar(
            text: "There is no user record corresponding to this identifier");
      } else if (err.code == "wrong-password") {
        GenericSnackBar(text: "Invalid Creaditials");
      } else if (err.code == 'timeout') {
        GenericSnackBar(text: 'The operation has timed out.');
      } else {
        GenericSnackBar(text: err.code);
      }
    } catch (err) {
      GenericSnackBar(text: "Some error occured");
    }
    return res;
  }

  // forgot password
  Future<String> forgotPassword({required String email}) async {
    String res = "Some error occred";
    try {
      await _auth.sendPasswordResetEmail(email: email);
      res = 'success';
    } on FirebaseException catch (e) {
      GenericSnackBar(text: "Some error occured");
    }
    return res;
  }

  // signout
  Future<String> signOut() async {
    String res = "Some error Occured";
    try {
      await _auth.signOut();
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
