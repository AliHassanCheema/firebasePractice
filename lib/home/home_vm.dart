import 'package:cached_map/cached_map.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'model.dart';

class HomeVuModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  String title = 'APPIC';
  UserList? model;
  List<String> titles = ['Crushes', 'Auqaat'];
  int currentIndex = 0;
  bool isPasswordVisible = false;
  String name = '';
  String age = '';
  String userName = '';
  String passWord = '';
  UserList userData = UserList(users: []);
  UserList userData1 = UserList(users: []);
  Users users = Users();
  List<UserList> auqaat = [];
  FirebaseAuth auth = FirebaseAuth.instance;
  HomeVuModel() {
    getFromCache();
    getFromCache1();
  }
  signOut() async {
    await auth.signOut();
  }

  onSaveName(value) {
    name = value;
  }

  onSaveAge(value) {
    age = value;
  }

  onSave() {
    formKey.currentState!.save();
    users = Users(name: name, age: age);
    userData.users!.add(users);
    cacheCurrentList();
    notifyListeners();
  }

  onUpdate(Users users, int i) {
    userData.users![i] = users;
    cacheCurrentList();
    notifyListeners();
  }

  cacheCurrentList() {
    Mapped.saveFileDirectly(file: userData.toJson(), cachedFileName: "users");
    notifyListeners();
  }

  onDelete(int i) {
    userData.users!.removeAt(i);
    cacheCurrentList();
    notifyListeners();
  }

  getFromCache() async {
    var json = await Mapped.loadFileDirectly(cachedFileName: "users");
    if (json != null) {
      UserList modal = UserList.fromJson(json);
      userData.users!.clear();
      if (modal.users != null) {
        userData.users!.addAll(modal.users!);
      }
    }
    notifyListeners();
  }

  onSaveFav() {
    formKey.currentState!.save();
    users = Users(name: name, age: age);
    userData1.users!.add(users);
    cacheCurrentList1();
    notifyListeners();
  }

  onDeleteFav(int i) {
    userData1.users!.removeAt(i);
    cacheCurrentList1();
    notifyListeners();
  }

  onUpdateFav(Users users, int i) {
    userData1.users![i] = users;
    cacheCurrentList1();
    notifyListeners();
  }

  cacheCurrentList1() {
    Mapped.saveFileDirectly(file: userData1.toJson(), cachedFileName: "users1");
    notifyListeners();
  }

  getFromCache1() async {
    var json = await Mapped.loadFileDirectly(cachedFileName: "users1");
    if (json != null) {
      UserList modal = UserList.fromJson(json);
      userData1.users!.clear();
      if (modal.users != null) {
        userData1.users!.addAll(modal.users!);
      }
    }
    notifyListeners();
  }

  onLogin() {
    formKey.currentState!.save();
    debugPrint('$userName >>>>>>>>>>>>>>>>>>>>>>>> $passWord');
  }

  onTapNavItem(int i) {
    currentIndex = i;
    title = titles[i];
    notifyListeners();
  }
}
