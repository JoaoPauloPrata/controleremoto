import 'dart:async';

import 'package:controle/infra/control_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Steering extends StatefulWidget {
  const Steering({Key? key}) : super(key: key);

  @override
  State<Steering> createState() => _SteeringState();
}

class _SteeringState extends State<Steering> {
  bool inThisPage = false;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    inThisPage = true;
    double dy = 1000;
    double variationValue = 100;
    int delay = 0;
    StreamSubscription subscription =
        gyroscopeEvents.listen((GyroscopeEvent event) async {
      dy += event.z * 100;
      delay += (event.z * 100).round();
      // print(dy);

      if (dy > (1300)) {
        ControlRequests().sendComand('presskey', {"keyPressed": "a"});
      } else if (dy > (1000 + variationValue)) {
        ControlRequests().sendComand('unpresskey', {"keyPressed": "d"});
        ControlRequests().sendComand('presskey', {"keyPressed": "a"});
        await Future.delayed(Duration(milliseconds: ((delay).abs())));
        ControlRequests().sendComand('unpresskey', {"keyPressed": "a"});
        await Future.delayed(Duration(milliseconds: (1000 - (delay).abs())));
      } else {
        ControlRequests().sendComand('unpresskey', {"keyPressed": "a"});
      }

      if (dy < 700) {
        ControlRequests().sendComand('presskey', {"keyPressed": "d"});
      } else if (dy < (1000 - variationValue)) {
        ControlRequests().sendComand('unpresskey', {"keyPressed": "a"});
        ControlRequests().sendComand('presskey', {"keyPressed": "d"});
        await Future.delayed(Duration(milliseconds: ((delay).abs())));
        ControlRequests().sendComand('unpresskey', {"keyPressed": "d"});
        await Future.delayed(Duration(milliseconds: (1000 - (delay).abs())));
      } else {
        ControlRequests().sendComand('unpresskey', {"keyPressed": "d"});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Listener(
                onPointerDown: (_) {
                  ControlRequests().sendComand("presskey", {"keyPressed": "w"});
                },
                onPointerUp: (_) {
                  ControlRequests()
                      .sendComand("unpresskey", {"keyPressed": "w"});
                },
                child: Container(
                  height: 100,
                  width: 300,
                  color: Colors.green,
                ),
              ),
              Listener(
                onPointerDown: (_) {
                  ControlRequests().sendComand("presskey", {"keyPressed": "s"});
                },
                onPointerUp: (_) {
                  ControlRequests()
                      .sendComand("unpresskey", {"keyPressed": "s"});
                },
                child: Container(
                  height: 100,
                  width: 300,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
