import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  @override
  SightListScreenState createState() => SightListScreenState();
}

class SightListScreenState extends State<SightListScreen> {
  final t = 'Список интересных мест';
  final r = 'Список интересных мест';

  // ignore: prefer_void_to_null
  Null get color => null;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(t),
          elevation: 0,
        ),
        body: Form(
          child: Container(
            decoration: BoxDecoration(color: color),
            width: double.infinity,
            height: 100,
            child: Text(
              r,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 50,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ),
      );
}
