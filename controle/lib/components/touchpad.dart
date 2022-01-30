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

  void backSpace() async {
    await http.post(Uri.parse('http://192.168.5.192:8000/backspace'));
  }

  void enter() async {
    await http.post(Uri.parse('http://192.168.5.192:8000/enter'));
  }

  void sendKey(String key) async {
    await http.post(Uri.parse('http://192.168.5.192:8000/presskey'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"keyPressed": key}));
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
  bool firstKeyboardTouch = false;
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double touchPadWidth = MediaQuery.of(context).size.width * 0.8;
    double touchPadHeight = isLandscape
        ? MediaQuery.of(context).size.height * 0.6
        : MediaQuery.of(context).size.height * 0.3;
    double leftButtonWidth = MediaQuery.of(context).size.width * 0.440;
    double rightButtonWidth = MediaQuery.of(context).size.width * 0.440;
    double scrollAreaHeight = isLandscape
        ? MediaQuery.of(context).size.height * 0.6
        : MediaQuery.of(context).size.height * 0.3;
    double scrollAreaWidth = MediaQuery.of(context).size.width * 0.08;

    String initialValueText = "";
    for (int i = 0; i < 1000; i++) {
      initialValueText = initialValueText + " ";
    }
    String keyboardValue = initialValueText;
    String previousKeyboardValue = initialValueText;
    TextEditingController controllerText = TextEditingController()
      ..text = initialValueText;
    controllerText.selection = TextSelection.fromPosition(
        TextPosition(offset: controllerText.text.length));
    return Container(
      color: Colors.white,
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
                          //Evitando que a função de mecher o mouse seja invocada fora da area do touchpad
                          if (details.localPosition.dx > 0 &&
                              details.localPosition.dy > 0 &&
                              details.localPosition.dy < (touchPadHeight) &&
                              details.localPosition.dx < (touchPadWidth)) {
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
                          color: Colors.blue,
                          border: Border.all(
                            color: Color(0xFF00417A),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: touchPadHeight,
                        width: touchPadWidth,
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
                        //Evitando que a função de mover o scroll seja ativada fora da area do scroll
                        if (details.localPosition.dx > 0 &&
                            details.localPosition.dy > 0 &&
                            details.localPosition.dy < (scrollAreaHeight) &&
                            details.localPosition.dx < (scrollAreaWidth)) {
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
                          color: Colors.blue,
                          border: Border.all(
                            color: Color(0xFF00417A),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: scrollAreaHeight,
                        width: scrollAreaWidth,
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
                        color: Colors.blue,
                        border: Border.all(
                          color: Color(0xFF00417A),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: isLandscape ? 50 : 35,
                      width: MediaQuery.of(context).size.width * 0.440,
                    ),
                  ),
                  SizedBox(
                    width: isLandscape
                        ? 20
                        : MediaQuery.of(context).size.width * 0.025,
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
                        color: Colors.blue,
                        border: Border.all(
                          color: Color(0xFF00417A),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: isLandscape ? 50 : 35,
                      width: leftButtonWidth,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 300,
                child: TextField(
                  controller: controllerText,
                  onChanged: (value) {
                    setState(() {
                      if (previousKeyboardValue.length > value.length) {
                        backSpace();
                      } else {
                        sendKey(value[value.length - 1]);
                      }
                    });
                  },
                  onSubmitted: (_) {
                    enter();
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Abrir Teclado',
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
