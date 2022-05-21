import 'package:authpractice/signup/signup_vu.dart';
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
                title: const Text('Auth By Firebaser'),
              ),
        body: viewModel.check
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Forget Password',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                              viewModel.emailController.text.trim(), context);
                        },
                      ),
                    )
                  ],
                ),
              )
            : Center(
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
                                const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 32),
                                TextFormField(
                                  controller: viewModel.emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: viewModel.passController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUpScreen()));
                                        },
                                        child: const Text('Signup')),
                                    TextButton(
                                        onPressed: () {
                                          viewModel.toggle();
                                        },
                                        child: const Text('Forget Password')),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  width: double.infinity,
                                  child: TextButton(
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      viewModel.onLogInUser(
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
      ),
    );
  }

  TextFormField customTextField(
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

  @override
  viewModelBuilder(BuildContext context) {
    return LoginViewModel();
  }
}
