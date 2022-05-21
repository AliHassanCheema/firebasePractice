import 'package:authpractice/login/signup_vu.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_vm.dart';

class LoginScreen extends ViewModelBuilderWidget<LoginViewModel> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return SafeArea(
      child: Scaffold(
        appBar: viewModel.check
            ? AppBar(
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      viewModel.toggle();
                    },
                    icon: const Icon(Icons.arrow_back)),
              )
            : AppBar(
                centerTitle: true,
                title: const Text('APPIC'),
              ),
        body: viewModel.isBusy
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.cyan[900],
              ))
            : viewModel.check
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/bg1.jpg',
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Reset Code',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.cyan[900]),
                                ),
                                const SizedBox(height: 20),
                                customTextField(
                                    label: 'Email',
                                    controller: viewModel.emailController,
                                    keyboardType: TextInputType.emailAddress),
                                const SizedBox(height: 20),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  width: double.infinity,
                                  child: TextButton(
                                    child: const Text(
                                      'Send Email',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      viewModel.forgetPassword(
                                          viewModel.emailController.text.trim(),
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
                  )
                : Container(
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
                            child: Center(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Welcome back to Appic',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.cyan[900]),
                                      ),
                                      const SizedBox(height: 32),
                                      customTextField(
                                          label: 'Email',
                                          controller:
                                              viewModel.emailController),
                                      const SizedBox(height: 16),
                                      customTextField(
                                          label: 'Password',
                                          controller: viewModel.passController,
                                          obscure: true),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const SignUpScreen()));
                                              },
                                              child: const Text('SignUp')),
                                          TextButton(
                                              onPressed: () {
                                                viewModel.toggle();
                                              },
                                              child: const Text(
                                                  'Forgot Password?')),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.cyan[900],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        width: double.infinity,
                                        child: TextButton(
                                          child: const Text(
                                            'Login',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            viewModel.onLogInUser(
                                                viewModel.emailController.text
                                                    .trim(),
                                                viewModel.passController.text
                                                    .trim(),
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
                  ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) {
    return LoginViewModel();
  }
}

Widget customTextField(
    {required String label,
    required TextEditingController controller,
    bool? obscure = false,
    TextInputType? keyboardType}) {
  return TextFormField(
    obscureText: obscure!,
    keyboardType: keyboardType,
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}
