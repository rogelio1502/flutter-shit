import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/signal_mode.dart';

class FloatingAction extends StatelessWidget {
  const FloatingAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signal = Provider.of<SignalMode>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {
              signal.signalMode = "Wifi Mode";
            },
            child: const Icon(Icons.wifi)),
        const SizedBox(
          height: 10.0,
        ),
        FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              signal.signalMode = "Bluetooh Mode";
            },
            child: const Icon(Icons.bluetooth))
      ],
    );
  }
}
