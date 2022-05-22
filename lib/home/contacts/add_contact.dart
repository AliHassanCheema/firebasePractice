import '../functions.dart';
import '../home_vm.dart';
import 'package:flutter/material.dart';
import '../model.dart';

class AddCrush extends StatelessWidget {
  final HomeVuModel viewModel;
  final Users? users;
  final int? i;
  const AddCrush(this.viewModel, this.users, this.i, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[900],
        title: const Text('Add Crush'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
              key: viewModel.formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    appicTextField('Name', viewModel.onSaveName, 10,
                        users == null ? '' : users!.name!),
                    const SizedBox(
                      height: 20,
                    ),
                    appicTextField('Age', viewModel.onSaveAge, 10,
                        users == null ? '' : users!.age!),
                    const SizedBox(
                      height: 20,
                    ),
                    appicSaveButton(context, 10, () {
                      if (users == null) {
                        viewModel.onSave();
                        Navigator.pop(context);
                      } else {
                        viewModel.onUpdate(users!, i!);
                        Navigator.pop(context);
                      }
                    }, 'Save'),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
