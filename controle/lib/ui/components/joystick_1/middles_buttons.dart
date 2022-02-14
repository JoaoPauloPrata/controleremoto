import 'package:controle/infra/control_requests.dart';
import 'package:flutter/material.dart';

Column middleButtons(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              ControlRequests()
                  .sendComand('pressandunpresskey', {"keyPressed": "o"});
            },
            child: Container(
              height: 30,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "SELECT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              ControlRequests()
                  .sendComand('pressandunpresskey', {"keyPressed": "p"});
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple,
              ),
              height: 30,
              width: 90,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "START",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    ],
  );
}
