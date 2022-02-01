import 'package:flutter/material.dart';

Column circleButtonsArea() {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          height: 70,
          width: 70,
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          height: 70,
          width: 70,
        ),
        SizedBox(
          height: 70,
          width: 70,
        ),
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          height: 70,
          width: 70,
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
          height: 70,
          width: 70,
        )
      ],
    )
  ]);
}
