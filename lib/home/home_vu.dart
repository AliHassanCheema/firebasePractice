import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'contacts/contact_vu.dart';
import 'favourites/fav_vu.dart';
import 'home_vm.dart';

class HomeScreen extends ViewModelBuilderWidget<HomeVuModel> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeVuModel viewModel, Widget? child) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.cyan[900],
          title: Text(
            viewModel.title,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  viewModel.signOut();
                },
                icon: const Icon(Icons.logout_sharp))
          ],
        ),
        body: IndexedStack(
          index: viewModel.currentIndex,
          children: [CrushesScreen(viewModel), Auqaat(viewModel)],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.cyan[900],
          selectedFontSize: 16,
          onTap: viewModel.onTapNavItem,
          currentIndex: viewModel.currentIndex,
          items: const [
            BottomNavigationBarItem(label: 'Crushes', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Auqaat', icon: Icon(Icons.list_alt_rounded)),
          ],
        ),
      ),
    );
  }

  Widget detailsCell(String titleDescription) {
    return Row(
      children: [
        Text(titleDescription,
            style: TextStyle(color: Colors.cyan[900], fontSize: 16))
      ],
    );
  }

  @override
  HomeVuModel viewModelBuilder(BuildContext context) {
    return HomeVuModel();
  }
}
