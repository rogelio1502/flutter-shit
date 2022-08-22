import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/signal_mode.dart';
import 'package:state_management/provider/user_provider.dart';
import 'package:state_management/models/user.dart';
import 'package:state_management/secure_storage/secure_storage.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // late  userProvider;
  final _formKey = GlobalKey<FormState>();
  final userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final signal = Provider.of<SignalMode>(context);
    // final userProvider = Provider.of<UserProvider>(context);
    // userModel.provider = user;
    print("Hola mundo");

    return Center(
      child: Column(
        children: [
          Text(
            signal.signalMode,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            userProvider.userName,
            style: const TextStyle(fontSize: 20),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Tu nombre"),
                  ),
                  onSaved: (newValue) {
                    // user.name = newValue.toString();
                    userProvider.user = User(name: newValue.toString());
                    userProvider.user?.saveData();
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState?.save();
                  },
                  child: const Text('Guardar'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // SecureStorage.readData('userName').then((value) {
    //   userProvider.user = User(
    //     name: value ?? '',
    //   );
    // });
  }
}
