import 'package:flutter/material.dart';
import 'package:places_yakimova_project/domain/sight.dart';
import 'package:places_yakimova_project/mocks.dart';
import 'package:places_yakimova_project/ui/screen/sight_details_screen.dart';
import 'package:places_yakimova_project/ui/screen/sight_list_screen.dart';
import 'package:places_yakimova_project/ui/screen/sight_visiting_screen.dart';
import 'package:places_yakimova_project/ui/screen/sight_visiting_screen.dart';

void main() {
  runApp(MyApp());
}

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
        // home: SightListScreen(), //Список интересных мест
        // home: SightDetailsScreen(
        //   sight: mocks.first,
        // ), // Галерея
        home: VisitingScreen(),
      );
}
