// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException {
      // this should never happen
    }
  }

  Future<bool> emailPassLogin(String userEmail, String userPass) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: userPass,
      );
      return true;
    } on FirebaseAuthException {
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<String> emailPassSignUp(String userEmail, String userPass) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPass,
      );
      //if success
      return "User Created!";
    } on FirebaseAuthException catch (e) {
      //if error
      if (e.code == 'weak-password') {
        return "Password must exceed 6 letters";
      } else if (e.code == 'email-already-in-use') {
        return "Email already in use. Try logging in!";
      } else if (e.code == 'invalid-email') {
        return "Invalid Email";
      } else {
        return e.code;
      }
    }
  }

  Future<bool> resetPassword(String userEmail) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: userEmail);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
