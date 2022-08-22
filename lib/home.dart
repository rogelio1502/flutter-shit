import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/signal_mode.dart';

import 'widgets/body.dart';
import 'widgets/floating_actions.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signal = Provider.of<SignalMode>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(signal.signalMode)),
      ),
      body: Body(),
      floatingActionButton: const FloatingAction(),
      backgroundColor:
          signal.signalMode == 'Wifi Mode' ? Colors.orange : Colors.blue,
    );
  }
}
