import 'package:controle/ui/components/joystick_1/arrows_buttons.dart';
import 'package:controle/ui/components/joystick_1/circle_buttons.dart';
import 'package:controle/ui/components/joystick_1/middles_buttons.dart';
import 'package:controle/ui/pages/init/init_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class JoysTick extends StatefulWidget {
  const JoysTick({Key? key}) : super(key: key);

  @override
  _JoysTickState createState() => _JoysTickState();
}

class _JoysTickState extends State<JoysTick> {
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
    void _returnInit(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return InitPage();
      }));
    }

    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: !isLandscape ? 50 : 0,
        actions: [
          IconButton(
              onPressed: () {
                _returnInit(context);
              },
              icon: Icon(Icons.home))
        ],
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
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: arrows_buttons(),
                    ),
                    Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: middleButtons(context)),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: circleButtonsArea(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
