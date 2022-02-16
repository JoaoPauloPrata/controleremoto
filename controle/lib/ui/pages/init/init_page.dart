import 'package:controle/ui/pages/pages.dart';
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
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionCard(mouseAndKeyboard, MousePad()),
                const SizedBox(
                  width: 30,
                ),
                OptionCard(joystick, JoysTick()),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionCard(volant, Container()),
                const SizedBox(
                  width: 30,
                ),
                OptionCard(settings, Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  OptionCard(String this.image, Widget this.page);
  Widget page;
  String image;
  @override
  Widget build(BuildContext context) {
    void _selectPage(BuildContext context, Widget page) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return page;
      }));
    }

    return GestureDetector(
      onTap: () {
        _selectPage(context, page);
      },
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
