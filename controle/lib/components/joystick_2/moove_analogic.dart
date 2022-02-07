import 'package:flutter/material.dart';

class MooveAnalogic extends StatefulWidget {
  MooveAnalogic({Key? key}) : super(key: key);

  @override
  State<MooveAnalogic> createState() => _MooveAnalogicState();
}

class _MooveAnalogicState extends State<MooveAnalogic> {
  @override
  Widget build(BuildContext context) {
    double controlHeight = MediaQuery.of(context).size.height * 0.9;
    double controlWidth = 300;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Listener(
                onPointerMove: (details) {
                  print(details.localPosition);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey, shape: BoxShape.circle),
                  height: controlHeight,
                  width: controlWidth,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
