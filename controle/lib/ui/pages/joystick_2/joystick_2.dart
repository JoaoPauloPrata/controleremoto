import 'package:controle/ui/components/joystick_2/arrows_buttons.dart';
import 'package:controle/ui/components/joystick_2/moove_analogic.dart';
import 'package:controle/ui/components/joystick_2/mouse_controller.dart';
import 'package:controle/ui/components/joystick_2/circle_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class JoysTick2 extends StatefulWidget {
  const JoysTick2({Key? key}) : super(key: key);

  @override
  _JoysTick2State createState() => _JoysTick2State();
}

class _JoysTick2State extends State<JoysTick2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: !isLandscape ? 50 : 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: Container(
        color: Colors.white,
        child: !isLandscape
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Vire o dispositivo para entrar no modo gamer",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  children: [
                    Flexible(
                        flex: 1, fit: FlexFit.tight, child: MooveAnalogic()),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleButton(Colors.red, "e"),
                              CircleButton(Colors.orange, "e"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: CircleButton(Colors.grey, "q"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: CircleButton(Colors.green, "q"),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleButton(Colors.indigo, "q"),
                              CircleButton(Colors.purple, "q"),
                            ],
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Analogico(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
