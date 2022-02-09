import 'dart:convert';

import 'package:controle/infra/control_requests.dart';
import 'package:controle/pages/joystick.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class MousePad extends StatefulWidget {
  MousePad({Key? key}) : super(key: key);

  @override
  State<MousePad> createState() => _MousePadState();
}

class _MousePadState extends State<MousePad> {
  bool firstKeyboardTouch = false;
  @override
  Widget build(BuildContext context) {
    void _selectPage(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return JoysTick();
      }));
    }

    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double touchPadWidth = MediaQuery.of(context).size.width * 0.8;
    double touchPadHeight = isLandscape
        ? MediaQuery.of(context).size.height * 0.6
        : MediaQuery.of(context).size.height * 0.7;
    double leftButtonWidth = isLandscape
        ? MediaQuery.of(context).size.width * 0.400
        : MediaQuery.of(context).size.width * 0.375;
    double rightButtonWidth = isLandscape
        ? MediaQuery.of(context).size.width * 0.400
        : MediaQuery.of(context).size.width * 0.375;
    ;
    double leftButtonHeight = isLandscape
        ? MediaQuery.of(context).size.height * 0.100
        : MediaQuery.of(context).size.height * 0.08;
    double rightButtonHeight = isLandscape
        ? MediaQuery.of(context).size.height * 0.100
        : MediaQuery.of(context).size.height * 0.08;
    double scrollAreaHeight = isLandscape
        ? MediaQuery.of(context).size.height * 0.6
        : MediaQuery.of(context).size.height * 0.7;
    double scrollAreaWidth = MediaQuery.of(context).size.width * 0.1;

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
    FocusNode keyBoardFocus = FocusNode();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _selectPage(context);
            },
            icon: Icon(Icons.gamepad),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Container(
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
                      onTap: () {
                        ControlRequests().sendComand('mouseclick', null);
                      },
                      child: Listener(
                        onPointerMove: (details) {
                          setState(() {
                            //Evitando que a função de mecher o mouse seja invocada fora da area do touchpad
                            if (details.localPosition.dx > 0 &&
                                details.localPosition.dy > 0 &&
                                details.localPosition.dy < (touchPadHeight) &&
                                details.localPosition.dx < (touchPadWidth)) {
                              ControlRequests().sendComand('moovemouse', {
                                "mooveAxisX": details.delta.dx,
                                "mooveAxisY": details.delta.dy
                              });
                            }
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
                          //Evitando que a função de mover o scroll seja ativada fora da area do scroll
                          if (details.localPosition.dx > 0 &&
                              details.localPosition.dy > 0 &&
                              details.localPosition.dy < (scrollAreaHeight) &&
                              details.localPosition.dx < (scrollAreaWidth)) {
                            ControlRequests().sendComand('mousescroll',
                                {"moove": details.delta.dx - details.delta.dy});
                          }
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
                  children: [
                    GestureDetector(
                      onTapDown: (_) {
                        ControlRequests().sendComand('pressleft', null);
                      },
                      onTapUp: (_) {
                        ControlRequests().sendComand('unpressleft', null);
                      },
                      onPanCancel: () {
                        ControlRequests().sendComand('unpressleft', null);
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
                        height: leftButtonHeight,
                        width: rightButtonWidth,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: Color(0xFF00417A),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: leftButtonHeight,
                      width: MediaQuery.of(context).size.width * 0.150,
                      child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            if (keyBoardFocus.hasFocus) {
                              keyBoardFocus.unfocus();
                              keyBoardFocus.requestFocus();
                            } else
                              keyBoardFocus.requestFocus();
                          },
                          icon: Icon(Icons.keyboard)),
                    ),
                    GestureDetector(
                      onTapDown: (_) {
                        ControlRequests().sendComand('pressright', null);
                      },
                      onTapUp: (_) {
                        ControlRequests().sendComand('unpressright', null);
                      },
                      onTapCancel: () {
                        ControlRequests().sendComand('unpressright', null);
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
                        height: rightButtonHeight,
                        width: leftButtonWidth,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  width: 1,
                  child: Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Visibility(
                        visible: true,
                        child: TextField(
                          focusNode: keyBoardFocus,
                          controller: controllerText,
                          onChanged: (value) {
                            setState(() {
                              if (previousKeyboardValue.length > value.length) {
                                ControlRequests().sendComand('backspace', null);
                              } else {
                                ControlRequests().sendComand(
                                  'pressandunpresskey',
                                  {"keyPressed": value[value.length - 1]},
                                );
                              }
                            });
                          },
                          onSubmitted: (_) {
                            ControlRequests().sendComand('enter', null);
                          },
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
