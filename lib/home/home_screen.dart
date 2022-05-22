import 'package:authpractice/login/login_vm.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = LoginViewModel();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                width: double.infinity,
                child: TextButton(
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    // viewModel.signOut();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
