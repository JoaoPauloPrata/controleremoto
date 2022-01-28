import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class PaginaControle extends StatefulWidget {
  const PaginaControle();
  @override
  State<PaginaControle> createState() => _PaginaControleState();
}

class _PaginaControleState extends State<PaginaControle> {
  bool _upButtonPressed = false;
  bool _leftButtonPressed = false;
  bool _rightButtonPressed = false;
  bool _downButtonPressed = false;

  void mooveMouseUp() async {
    while (_upButtonPressed) {
      http.get(Uri.parse('http://192.168.5.192:8000/up'));
      await Future.delayed(Duration(milliseconds: 10));
    }
  }

  void mooveMouseDown() async {
    while (_downButtonPressed) {
      http.get(Uri.parse('http://192.168.5.192:8000/down'));
      await Future.delayed(Duration(milliseconds: 10));
    }
  }

  void mooveMouseRight() async {
    while (_rightButtonPressed) {
      http.get(Uri.parse('http://192.168.5.192:8000/right'));
      await Future.delayed(Duration(milliseconds: 10));
    }
  }

  void mooveMouseLeft() async {
    while (_leftButtonPressed) {
      http.get(Uri.parse('http://192.168.5.192:8000/left'));
      await Future.delayed(Duration(milliseconds: 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Listener(
                  onPointerDown: (_) {
                    _upButtonPressed = true;
                    mooveMouseUp();
                  },
                  onPointerUp: (_) {
                    _upButtonPressed = false;
                  },
                  child: Container(
                    color: Colors.red,
                    height: 50,
                    width: 50,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Listener(
                  onPointerDown: (_) {
                    _leftButtonPressed = true;
                    mooveMouseLeft();
                  },
                  onPointerUp: (_) {
                    _leftButtonPressed = false;
                  },
                  child: Container(
                    color: Colors.green,
                    height: 50,
                    width: 50,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Listener(
                  onPointerDown: (_) {
                    _rightButtonPressed = true;
                    mooveMouseRight();
                  },
                  onPointerUp: (_) {
                    _rightButtonPressed = false;
                  },
                  child: Container(
                    color: Colors.yellow,
                    height: 50,
                    width: 50,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Listener(
                  onPointerDown: (_) {
                    _downButtonPressed = true;
                    mooveMouseDown();
                  },
                  onPointerUp: (_) {
                    _downButtonPressed = false;
                  },
                  child: Container(
                    color: Colors.blue,
                    height: 50,
                    width: 50,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
