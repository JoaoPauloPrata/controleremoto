import 'package:controle/infra/control_requests.dart';
import 'package:flutter/material.dart';

Column circleButtonsArea() {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleButton(Colors.blue, "q"),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleButton(Colors.red, "e"),
        SizedBox(
          height: 70,
          width: 70,
        ),
        CircleButton(Colors.green, "r"),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleButton(Colors.yellow, "f"),
      ],
    )
  ]);
}

class CircleButton extends StatelessWidget {
  CircleButton(Color this.buttonColor, String this.pressedKey);
  Color buttonColor;
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
      onTapCancel: () {
        ControlRequests().sendComand('unpresskey', {"keyPressed": pressedKey});
      },
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: buttonColor),
        height: 80,
        width: 80,
        child: Center(
          child: Text(
            pressedKey.toUpperCase(),
            style: TextStyle(fontSize: 30, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
