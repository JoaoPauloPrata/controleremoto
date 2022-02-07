import 'package:controle/pages/joystick.dart';
import 'package:controle/components/joystick_2/mouse_controller.dart';
import 'package:controle/pages/joystick_2.dart';
import 'package:controle/pages/touchpad.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ControleRemoto()));
}

class ControleRemoto extends StatelessWidget {
  const ControleRemoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MousePad();
  }
}
