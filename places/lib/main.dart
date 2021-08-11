import 'package:flutter/material.dart';
import 'package:places_yakimova_project/mocks.dart';
import 'package:places_yakimova_project/ui/screen/sight_details_screen.dart';
//import 'package:places_yakimova_project/ui/screen/sight_list_screen.dart';

void main() {
  runApp(MyApp());
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
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto',
        ),
        //home: SightListScreen(), //Список интересных мест
        home: SightDetailsScreen(
          sight: mocks.first,
        ), // Галерея
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
          centerTitle: true,
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
