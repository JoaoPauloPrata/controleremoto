import 'package:controle/pages/joystick.dart';
import 'package:controle/pages/touchpad.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ControleRemoto());
}

class ControleRemoto extends StatelessWidget {
  const ControleRemoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: JoysTick(),
      ),
    );
  }
}
