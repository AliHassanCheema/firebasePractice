import 'package:authpractice/login/login_vu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

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
