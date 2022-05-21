import 'package:authpractice/login/login_vm.dart';
import 'package:authpractice/login/login_vu.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignUpScreen extends ViewModelBuilderWidget<LoginViewModel> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('APPIC'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/bg1.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: viewModel.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome to Appic',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 32),
                        customTextField(
                            controller: viewModel.nameController,
                            label: 'Name'),
                        const SizedBox(height: 16),
                        customTextField(
                            controller: viewModel.emailController,
                            label: 'Email'),
                        const SizedBox(height: 16),
                        customTextField(
                            controller: viewModel.passController,
                            obscure: true,
                            label: 'Password'),
                        const SizedBox(height: 4),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: Row(
                              children: const [
                                Text('LogIn'),
                              ],
                            )),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: double.infinity,
                          child: TextButton(
                            child: const Text(
                              'SignUp',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              viewModel.onSignUp(
                                  viewModel.emailController.text.trim(),
                                  viewModel.passController.text.trim(),
                                  context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) {
    return LoginViewModel();
  }
}
