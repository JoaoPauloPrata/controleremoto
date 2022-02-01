import 'package:flutter/material.dart';

Column arrows_buttons() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.blue,
          ),
        ],
      ),
      Row(
        children: [
          Container(
            height: 50,
            width: 50,
            color: Colors.blue,
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.blue,
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.blue,
          ),
        ],
      ),
      Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.blue,
          ),
        ],
      ),
    ],
  );
}
