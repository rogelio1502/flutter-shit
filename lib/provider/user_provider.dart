import 'package:flutter/material.dart';
import 'package:state_management/models/user.dart';
import 'package:state_management/secure_storage/secure_storage.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  set user(User? userInstance) {
    _user = userInstance;
    SecureStorage.saveData('userName', userInstance!.name);
    notifyListeners();
  }

  void obtainUsername() async {
    User? user = User(name: await SecureStorage.readData('userName') ?? '');
    this.user = user;
  }
}
