import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  const PaginaControle();

  void mooveMouseUp() {
    http.get(Uri.parse('http://192.168.5.192:8000/up'));
  }

  void mooveMouseDown() {
    http.get(Uri.parse('http://192.168.5.192:8000/down'));
  }

  void mooveMouseLeft() {
    http.get(Uri.parse('http://192.168.5.192:8000/left'));
  }

  void mooveMouseRight() {
    http.get(Uri.parse('http://192.168.5.192:8000/right'));
  }

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
                          shape: CircleBorder(), color: Colors.red),
                      child: IconButton(
                        onPressed: mooveMouseUp,
                        icon: Icon(Icons.circle),
                        color: Colors.white,
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
                        onPressed: mooveMouseLeft,
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
                          shape: CircleBorder(), color: Colors.yellow),
                      child: IconButton(
                        onPressed: mooveMouseRight,
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
                          shape: CircleBorder(), color: Colors.green),
                      child: IconButton(
                        onPressed: mooveMouseDown,
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
