import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/signal_mode.dart';
import 'package:state_management/provider/user_provider.dart';
import 'package:state_management/models/user.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // late  userProvider;
  final _formKey = GlobalKey<FormState>();
  late SignalMode signal;
  late UserProvider userProvider;
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            signal.signalMode,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            (userProvider.user?.name == "" || userProvider.user?.name == null)
                ? "Dame tu nombre"
                : userProvider.user!.name,
            style: const TextStyle(fontSize: 20),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Tu nombre"),
                  ),
                  onSaved: (newValue) {
                    // user.name = newValue.toString();
                    userProvider.user = User(name: newValue.toString());
                    nameController.text = "";
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
  void didChangeDependencies() {
    // TODO: implement didChangeDep543543endencies
    super.didChangeDependencies();
    userProvider = Provider.of<UserProvider>(context);
    signal = Provider.of<SignalMode>(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userProvider.obtainUsername();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }
}
