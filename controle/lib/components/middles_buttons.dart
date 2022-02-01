import 'package:controle/pages/touchpad.dart';
import 'package:flutter/material.dart';

Column middleButtons(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
              return MousePad();
            }));
          },
          child: Text("SAIR")),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("SELECT"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("START"),
          ),
        ],
      ),
    ],
  );
}
