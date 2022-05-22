import 'package:authpractice/home/detection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_vu.dart';

class LoginViewModel extends BaseViewModel {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var nameController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool check = false;
  // Sign in User
  onLogInUser(String email, String password, BuildContext context) async {
    try {
      setBusy(true);
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        debugPrint('login successfully!');
      }).then((value) => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Detection())));
      setBusy(false);
    } on FirebaseAuthException catch (error) {
      setBusy(false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(error.message.toString()),
        ),
      );
    }
  }

  toggle() {
    check = !check;
    notifyListeners();
  }

  forgetPassword(String email, BuildContext context) async {
    try {
      await auth.sendPasswordResetEmail(email: email).then(
            (value) => showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                content: Text('Email sent'),
              ),
            ).then((value) => toggle()),
          );
    } catch (error) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text(error.toString()),
              ));
    }
    notifyListeners();
  }

  //Add User
  onSignUp(String email, String password, BuildContext context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen())));
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Created')));
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }
}
