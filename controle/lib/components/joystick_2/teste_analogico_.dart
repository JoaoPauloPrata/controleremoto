import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Analogico extends StatefulWidget {
  Analogico({Key? key}) : super(key: key);

  @override
  State<Analogico> createState() => _AnalogicoState();
}

class _AnalogicoState extends State<Analogico> {
  @override
  Widget build(BuildContext context) {
    bool usingAnalogic = false;
    double axisX = 0.0;
    double deltaX = 0;
    double deltaY = 0;
    double axisY = 0.0;
    void mooveMouse() async {
      bool axisXnull = false;

      int countX = 0;
      int countY = 0;

      double deslocationX = axisX / axisX;
      double deslocationY = axisX / axisY;

      while (usingAnalogic) {
        await http.post(Uri.parse('http://192.168.5.192:8000/moovejoystick'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(
                <String, double>{"mooveAxisX": axisX, "mooveAxisY": axisY}));

        await Future.delayed(Duration(milliseconds: 5));
      }
    }

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Listener(
              onPointerMove: (details) {
                if (sqrt(((details.localPosition.dx - 150) *
                            (details.localPosition.dx - 150)) +
                        ((details.localPosition.dy - 150) *
                            (details.localPosition.dy - 150))) <
                    150) {
                  axisX = (details.localPosition.dx - 150) / 3;
                  axisY = (details.localPosition.dy - 150) / 3;
                  print(sqrt(((details.localPosition.dx - 150) *
                          (details.localPosition.dx - 150)) +
                      ((details.localPosition.dy - 150) *
                          (details.localPosition.dy - 150))));
                }
              },
              onPointerDown: (details) {
                usingAnalogic = true;
                if (details.localPosition.dx > 100 &&
                    details.localPosition.dx < 200 &&
                    details.localPosition.dy > 100 &&
                    details.localPosition.dy < 200) mooveMouse();
              },
              onPointerUp: (event) {
                axisX = 0.0;
                axisY = 0.0;
                usingAnalogic = false;
              },
              child: Stack(children: [
                Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                  height: 300,
                  width: 300,
                ),
                Positioned(
                  top: 100,
                  left: 100,
                  child: Draggable(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                    ),
                    feedback: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
