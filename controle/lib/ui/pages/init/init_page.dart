import 'package:controle/infra/database_helper.dart';
import 'package:controle/ui/pages/pages.dart';
import 'package:controle/ui/pages/steering/steering.dart';
import 'package:flutter/material.dart';
import 'package:controle/infra/base_url.dart' as url;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sqflite/sqflite.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  _InitPageState createState() => _InitPageState();
}

class KeyProps {
  KeyProps(this.id, this.value, this.key);
  String id;
  String value;
  String key;
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    List<KeyProps> _itens = [];
    void loadData() async {
      DatabaseHelper.insert(
          'settings', {'id': 3, 'value': 'a', 'key': 'leftArrowButton'});
      final dataList = await DatabaseHelper.getData('settings');

      _itens = dataList
          .map(
            (data) => KeyProps(data['id'], data['value'], data['key']),
          )
          .toList();
    }

    String joystick = 'assets/images/joystick.png';
    String steering = 'assets/images/steering.png';
    String settings = 'assets/images/settings.png';
    String mouseAndKeyboard = 'assets/images/keyboard-and-mouse.png';
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     OptionCard(steering, Steering()),
              //     const SizedBox(
              //       width: 30,
              //     ),
              //     OptionCard(settings, Container()),
              //   ],
              // ),
            ],
          )),
    );
  }
}

class OptionCard extends StatefulWidget {
  OptionCard(String this.image, Widget this.page);
  Widget page;
  String image;

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    void _selectPage(BuildContext context, Widget page) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return page;
      }));
    }

    return GestureDetector(
      onTap: () {
        if (url.baseUrl != "" && url.baseUrl != "-1") {
          _selectPage(context, widget.page);
        } else {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Não sincronizado"),
              content: Text(
                  "Antes de começar a usar, você precisa escanear o qrCode."),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() async {
                        url.baseUrl = await FlutterBarcodeScanner.scanBarcode(
                            "#FFFFFF", "Cancelar", false, ScanMode.QR);
                      });
                    },
                    child: Text("Escanear"))
              ],
            ),
          );
        }
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
                widget.image,
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
