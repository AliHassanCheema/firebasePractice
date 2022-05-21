import 'package:authpractice/home/detection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool check = false;
  // Sign in User
  onLogInUser(String email, String password, BuildContext context) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => debugPrint('login successfully!'))
          .then((value) => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Detection())));
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
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
    } on FirebaseAuthException catch (error) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text(error.toString()),
              ));
    }
    notifyListeners();
  }

  signOut() async {
    await auth.signOut();
  }
}
