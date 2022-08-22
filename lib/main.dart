import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/home.dart';
import 'package:state_management/provider/signal_mode.dart';
import 'package:state_management/provider/user_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => SignalMode(),
        child: ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: const MaterialApp(
            title: 'Provider',
            home: Home(),
          ),
        ));
  }
}
