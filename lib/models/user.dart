import 'package:state_management/secure_storage/secure_storage.dart';

class User {
  User({
    this.name = "",
  });

  String name;

  User copyWith({
    String? name,
  }) {
    return User(name: name ?? this.name);
  }

  String? getName() {
    SecureStorage.readData('userName').then((value) {
      print(value);
      return value.toString();
    });
  }

  void saveData() {
    SecureStorage.saveData('userName', this.name);
  }
}
