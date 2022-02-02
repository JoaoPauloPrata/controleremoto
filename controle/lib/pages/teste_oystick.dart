import 'dart:convert';

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
    double axisY = 0.0;
    void mooveMouse() async {
      while (usingAnalogic) {
        await http.post(Uri.parse('http://192.168.5.192:8000/moovemouse'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, double>{
              "mooveAxisX": axisX * 20,
              "mooveAxisY": axisY * 20
            }));
        await Future.delayed(Duration(milliseconds: 5));
      }
    }

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Listener(
                onPointerMove: (details) {
                  axisX = (details.localPosition.dx - 150) / 150;
                  axisY = (details.localPosition.dy - 150) / 150;
                  print(details.localPosition);
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
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
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
      ),
    );
  }
}
