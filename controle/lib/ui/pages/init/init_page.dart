import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    String joystick = 'assets/images/joystick.png';
    String volant = 'assets/images/volant.png';
    String settings = 'assets/images/settings.png';
    String mouseAndKeyboard = 'assets/images/keyboard-and-mouse.png';
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionCard(mouseAndKeyboard),
                const SizedBox(
                  width: 30,
                ),
                OptionCard(joystick),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionCard(volant),
                const SizedBox(
                  width: 30,
                ),
                OptionCard(settings),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  OptionCard(String this.image);
  String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22), color: Colors.blue),
              height: 150,
              width: 150,
            ),
            Positioned(
              bottom: 25,
              left: 25,
              child: Image.asset(
                image,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
