import '../home_vm.dart';
import 'package:flutter/material.dart';
import 'add_contact.dart';

class CrushesScreen extends StatelessWidget {
  final HomeVuModel viewModel;
  const CrushesScreen(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return viewModel.getFromCache();
        },
        child: ListView.builder(
          itemCount: viewModel.userData.users!.length,
          itemBuilder: (context, index) {
            return listCell(index, context, viewModel);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[900],
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddCrush(viewModel, null, null);
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget listCell(int index, BuildContext context, HomeVuModel viewModel) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AddCrush(viewModel, viewModel.userData.users![index], index);
        }));
      },
      child: Card(
        color: Colors.cyan[900],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8.0),
          child: Row(
            children: [
              Text(
                viewModel.userData.users![index].name!,
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              Text(
                viewModel.userData.users![index].age!,
                style: const TextStyle(color: Colors.white),
              ),
              IconButton(
                  onPressed: () {
                    viewModel.onDelete(index);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
