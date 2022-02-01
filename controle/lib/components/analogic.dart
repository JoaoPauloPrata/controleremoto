import 'package:flutter/material.dart';

Column analogic() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 130,
            width: 130,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          )
        ],
      )
    ],
  );
}
