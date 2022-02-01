import 'package:controle/infra/control_requests.dart';
import 'package:flutter/material.dart';

Column arrows_buttons() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          SizedBox(
            height: 70,
            width: 70,
          ),
          ArrowButton("w"),
        ],
      ),
      Row(
        children: [
          ArrowButton("a"),
          Container(
            height: 70,
            width: 70,
            color: Colors.blue,
          ),
          ArrowButton("d"),
        ],
      ),
      Row(
        children: [
          SizedBox(
            height: 70,
            width: 70,
          ),
          ArrowButton("s"),
        ],
      ),
    ],
  );
}

class ArrowButton extends StatelessWidget {
  ArrowButton(String this.pressedKey);
  String pressedKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        ControlRequests().sendComand('\presskey', {"keyPressed": pressedKey});
      },
      onTapUp: (details) {
        ControlRequests().sendComand('unpresskey', {"keyPressed": pressedKey});
      },
      child: Container(
        height: 70,
        width: 70,
        color: Colors.blue,
      ),
    );
  }
}
