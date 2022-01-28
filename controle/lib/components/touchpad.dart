import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class MousePad extends StatefulWidget {
  MousePad({Key? key}) : super(key: key);

  @override
  State<MousePad> createState() => _MousePadState();
}

class _MousePadState extends State<MousePad> {
  void pressRightButton() async {
    await http.post(Uri.parse('http://192.168.5.192:8000/pressright'));
  }

  void unPressRightButton() async {
    await http.post(Uri.parse('http://192.168.5.192:8000/unpressright'));
  }

  void pressLeftButton() async {
    await http.post(Uri.parse('http://192.168.5.192:8000/pressleft'));
  }

  void unPressLeftButton() async {
    await http.post(Uri.parse('http://192.168.5.192:8000/unpressleft'));
  }

  void mouseClick() async {
    await http.post(Uri.parse('http://192.168.5.192:8000/mouseclick'));
  }

  void mouseScroll(double scrollMoovement) async {
    await http.post(Uri.parse('http://192.168.5.192:8000/mousescroll'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, double>{
          "moove": scrollMoovement,
        }));
  }

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

  Offset atualPosition = Offset(0, 0);
  Offset previousPosition = Offset(0, 0);
  bool firstMouseMoove = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0F0F0F),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: mouseClick,
                    child: Listener(
                      onPointerMove: (details) {
                        setState(() {
                          if (firstMouseMoove) {
                            previousPosition = details.localPosition;
                            atualPosition = details.localPosition;
                            firstMouseMoove = false;
                          } else {
                            previousPosition = atualPosition;
                            atualPosition = details.localPosition;
                          }

                          if (details.localPosition.dx > 0 &&
                              details.localPosition.dy > 0 &&
                              details.localPosition.dy <
                                  (MediaQuery.of(context).size.height * 0.3) &&
                              details.localPosition.dx <
                                  (MediaQuery.of(context).size.width * 0.9)) {
                            mooveMouse(atualPosition.dx - previousPosition.dx,
                                atualPosition.dy - previousPosition.dy);
                          }
                        });
                      },
                      onPointerUp: (details) {
                        setState(() {
                          firstMouseMoove = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF343535),
                          border: Border.all(
                            color: Color(0xFFF8220F),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  // Listenner que simula o scrool de um touchpad
                  Listener(
                    onPointerMove: (details) {
                      setState(() {
                        if (firstMouseMoove) {
                          previousPosition = details.localPosition;
                          atualPosition = details.localPosition;
                          firstMouseMoove = false;
                        } else {
                          previousPosition = atualPosition;
                          atualPosition = details.localPosition;
                        }

                        if (details.localPosition.dx > 0 &&
                            details.localPosition.dy > 0 &&
                            details.localPosition.dy <
                                (MediaQuery.of(context).size.height * 0.3) &&
                            details.localPosition.dx <
                                (MediaQuery.of(context).size.width * 0.9)) {
                          mouseScroll(previousPosition.dy - atualPosition.dy);
                        }
                      });
                    },
                    onPointerUp: (_) {
                      setState(() {
                        firstMouseMoove = true;
                      });
                    },
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF343535),
                          border: Border.all(
                            color: Color(0xFFF8220F),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.08,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTapDown: (_) {
                      pressLeftButton();
                    },
                    onTapUp: (_) {
                      unPressLeftButton();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF343535),
                        border: Border.all(
                          color: Color(0xFFF8220F),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.440,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  GestureDetector(
                    onTapDown: (_) {
                      pressRightButton();
                    },
                    onTapUp: (_) {
                      unPressRightButton();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF343535),
                        border: Border.all(
                          color: Color(0xFFF8220F),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.440,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
