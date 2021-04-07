import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyFirstWidget extends StatelessWidget {
  var _count = 0;
  @override
  Widget build(BuildContext context) {
    _count++;
    return Center(
      child: Text('Hello! $_count'),
    );
  }
}

class MyFirstWidget2 extends StatefulWidget {
  @override
  _MyFirstWidget2State createState() => _MyFirstWidget2State();
}

class _MyFirstWidget2State extends State<MyFirstWidget2> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    _count++;
    return Center(
      child: Text('Hello! $_count'),
    );
  }
}

/// Мое первое приложение, создано для тестирования.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyFirstWidget(),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}
