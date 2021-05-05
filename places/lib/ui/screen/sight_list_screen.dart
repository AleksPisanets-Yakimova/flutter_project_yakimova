import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  @override
  SightListScreenState createState() => SightListScreenState();
}

class SightListScreenState extends State<SightListScreen> {
  final t = 'Hello!';
  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: Text(t)));
}
