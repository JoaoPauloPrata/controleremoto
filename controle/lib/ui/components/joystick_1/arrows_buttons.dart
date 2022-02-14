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
          RotatedBox(quarterTurns: 1, child: ArrowButton("w")),
        ],
      ),
      Row(
        children: [
          RotatedBox(quarterTurns: 0, child: ArrowButton("a")),
          Container(
            height: 70,
            width: 70,
            color: Colors.blue,
          ),
          RotatedBox(quarterTurns: 2, child: ArrowButton("d")),
        ],
      ),
      Row(
        children: [
          SizedBox(
            height: 70,
            width: 70,
          ),
          RotatedBox(quarterTurns: 3, child: ArrowButton("s")),
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
          ControlRequests()
              .sendComand('unpresskey', {"keyPressed": pressedKey});
        },
        onTapCancel: () {
          ControlRequests()
              .sendComand('unpresskey', {"keyPressed": pressedKey});
        },
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
          ),
        ));
  }
}
