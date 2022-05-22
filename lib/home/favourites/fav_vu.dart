import 'add_fav.dart';
import '../home_vm.dart';
import 'package:flutter/material.dart';

class Auqaat extends StatelessWidget {
  final HomeVuModel viewModel;
  const Auqaat(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return viewModel.getFromCache1();
        },
        child: ListView.builder(
          itemCount: viewModel.userData1.users!.length,
          itemBuilder: (context, index) {
            return listCell(index, context, viewModel);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'Auqaat',
        backgroundColor: Colors.cyan[900],
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddAuqaat(
              viewModel,
            );
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget listCell(int index, BuildContext context, HomeVuModel viewModel) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Colors.cyan[900],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8.0),
          child: Row(
            children: [
              Text(
                viewModel.userData1.users![index].name!,
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              Text(
                viewModel.userData1.users![index].age!,
                style: const TextStyle(color: Colors.white),
              ),
              IconButton(
                  onPressed: () {
                    viewModel.onDeleteFav(index);
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
