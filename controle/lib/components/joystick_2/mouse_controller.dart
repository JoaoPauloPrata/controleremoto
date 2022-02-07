import 'dart:convert';
import 'dart:math';
import 'package:controle/infra/control_requests.dart';
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
    double controlHeight = MediaQuery.of(context).size.height * 0.9;

    double controlWidth = 300;
    void mooveMouse(double axisXmoove, double axisYmoove) async {
      await http.post(Uri.parse('http://192.168.5.192:8000/moovemouse'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, double>{
            "mooveAxisX": axisXmoove * 3,
            "mooveAxisY": axisYmoove * 3
          }));
    }

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Listener(
                onPointerMove: (details) {
                  if (sqrt(((details.localPosition.dx - controlWidth / 2) *
                              (details.localPosition.dx - controlWidth / 2)) +
                          ((details.localPosition.dy - controlWidth / 2) *
                              (details.localPosition.dy - controlWidth / 2))) <
                      150) {
                    mooveMouse(details.localDelta.dx, details.localDelta.dy);
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(200),
                          bottomLeft: Radius.circular(200))),
                  height: controlHeight,
                  width: controlWidth,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
