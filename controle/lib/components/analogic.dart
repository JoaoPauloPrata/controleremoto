import 'package:controle/infra/control_requests.dart';
import 'package:flutter/material.dart';

class Analogic extends StatefulWidget {
  const Analogic({Key? key}) : super(key: key);

  @override
  _AnalogicState createState() => _AnalogicState();
}

class _AnalogicState extends State<Analogic> {
  Offset atualPosition = Offset(0, 0);
  Offset previousPosition = Offset(0, 0);
  bool _stopAnalogic = false;
  bool firstMouseMoove = true;
  void constantMouseMoove() async {
    while (_stopAnalogic) {
      ControlRequests().sendComand('\moovemouse', {
        "mooveAxisX": (atualPosition.dx - previousPosition.dx) * 6,
        "mooveAxisY": (atualPosition.dy - previousPosition.dy) * 6
      });
      await Future.delayed(Duration(milliseconds: 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Listener(
              onPointerMove: (details) {
                if (details.localPosition.dx < 150 &&
                    details.localPosition.dx > 0 &&
                    details.localPosition.dy < 150 &&
                    details.localPosition.dy > 0) {
                  if (firstMouseMoove) {
                    previousPosition = details.localPosition;
                    atualPosition = details.localPosition;
                    firstMouseMoove = false;
                  } else {
                    previousPosition = atualPosition;
                    atualPosition = details.localPosition;
                  }
                  ControlRequests().sendComand('\moovemouse', {
                    "mooveAxisX": (atualPosition.dx - previousPosition.dx) * 3,
                    "mooveAxisY": (atualPosition.dy - previousPosition.dy) * 3
                  });
                } else if (!_stopAnalogic) {
                  _stopAnalogic = true;
                  constantMouseMoove();
                }

                //Evitando que a função de mecher o mouse seja invocada fora da area do touchpad
              },
              onPointerUp: (details) {
                _stopAnalogic = false;
                print(_stopAnalogic);
              },
              child: Stack(children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                ),
                Positioned(
                    top: 50,
                    left: 50,
                    child: Draggable(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ),
                      feedback: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ),
                    )),
              ]),
            )
          ],
        )
      ],
    );
  }
}
