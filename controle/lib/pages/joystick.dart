import 'package:controle/components/analogic.dart';
import 'package:controle/components/arrows_buttons.dart';
import 'package:controle/components/circle_buttons.dart';
import 'package:controle/components/middles_buttons.dart';
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
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: !isLandscape
            ? Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Vire o dispositivo para entrar no modo gamer",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ))
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
