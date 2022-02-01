import 'package:controle/components/analogic.dart';
import 'package:controle/components/arrows_buttons.dart';
import 'package:controle/components/circle_buttons.dart';
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: arrows_buttons(),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: analogic(),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: circleButtonsArea(),
            ),
          ],
        ),
      ),
    );
  }
}
