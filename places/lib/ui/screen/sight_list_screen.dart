import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  @override
  SightListScreenState createState() => SightListScreenState();
}

class SightListScreenState extends State<SightListScreen> {
  final titleText = 'Cписок интересных мест';
  final S = 'С';
  final s = 'писок ';
  final i = 'и';
  final m = 'нтересных мест';

  // ignore: prefer_void_to_null
  Null get color => null;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(titleText),
          elevation: 0,
        ),
        body: Form(
          child: Container(
            decoration: BoxDecoration(color: color),
            width: double.infinity,
            height: 100,
            child: RichText(
              text: TextSpan(
                  text: S,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 45,
                    fontFamily: 'Roboto',
                  ),
                  children: [
                    TextSpan(
                        text: s,
                        style: const TextStyle(
                          color: Colors.black,
                        )),
                    TextSpan(
                        text: i,
                        style: const TextStyle(
                          color: Colors.yellow,
                        )),
                    TextSpan(
                        text: m,
                        style: const TextStyle(
                          color: Colors.black,
                        )),
                  ]),
              maxLines: 2,
            ),
          ),
        ),
      );
}
