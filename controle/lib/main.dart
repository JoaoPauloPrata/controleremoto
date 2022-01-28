import 'package:controle/components/mousepad.dart';
import 'package:flutter/material.dart';

import 'components/arrosw_buttons.dart';

void main() {
  runApp(const ControleRemoto());
}

class ControleRemoto extends StatelessWidget {
  const ControleRemoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MousePad(),
    );
  }
}
