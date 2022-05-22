import '../home_vm.dart';
import 'package:flutter/material.dart';

import '../functions.dart';

class AddAuqaat extends StatelessWidget {
  final HomeVuModel viewModel;
  const AddAuqaat(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[900],
        title: const Text('Add Auqaat'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
              key: viewModel.formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    appicTextField('Name', viewModel.onSaveName, 10, ''),
                    const SizedBox(
                      height: 20,
                    ),
                    appicTextField('Age', viewModel.onSaveAge, 10, ''),
                    const SizedBox(
                      height: 20,
                    ),
                    appicSaveButton(context, 10, () {
                      viewModel.onSaveFav();
                      Navigator.pop(context);
                    }, 'Save'),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
