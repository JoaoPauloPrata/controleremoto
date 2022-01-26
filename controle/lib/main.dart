import 'package:flutter/material.dart';

void main() {
  runApp(const ControleRemoto());
}

class ControleRemoto extends StatelessWidget {
  const ControleRemoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaControle(),
    );
  }
}

class PaginaControle extends StatelessWidget {
  const PaginaControle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Ink(
                      decoration: ShapeDecoration(
                          shape: CircleBorder(), color: Colors.blue),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.circle),
                        color: Colors.white,
                        focusColor: Colors.black,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Ink(
                      decoration: ShapeDecoration(
                          shape: CircleBorder(), color: Colors.blue),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.circle),
                        color: Colors.white,
                        focusColor: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Ink(
                      decoration: ShapeDecoration(
                          shape: CircleBorder(), color: Colors.blue),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.circle),
                        color: Colors.white,
                        focusColor: Colors.black,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Ink(
                      decoration: ShapeDecoration(
                          shape: CircleBorder(), color: Colors.blue),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.circle),
                        color: Colors.white,
                        focusColor: Colors.black,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
