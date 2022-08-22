import 'package:flutter/material.dart';
import 'package:state_management/models/user.dart';
import 'package:state_management/secure_storage/secure_storage.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;
  set user(User? user) {
    _user = user;
    _user?.saveData();
    notifyListeners();
  }

  String get userName {
    print(_user?.name);
    return _user?.name ?? '';
  }
}
