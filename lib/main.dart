import 'package:flutter/material.dart';
import 'package:places_yakimova_project/domain/sight.dart';
import 'package:places_yakimova_project/mocks.dart';
import 'package:places_yakimova_project/ui/screen/const/value_text.dart';
import 'package:places_yakimova_project/ui/screen/rez/themes.dart';

import 'package:places_yakimova_project/ui/screen/sight_details_screen.dart';
import 'package:places_yakimova_project/ui/screen/sight_list_screen.dart';
import 'package:places_yakimova_project/ui/screen/sight_visiting_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppTexts.title,
        theme: AppTheme.lightTheme, //AppTheme.darkTheme

        // home: SightListScreen(), //Список интересных мест +++++++
        // home: SightDetailsScreen(
        //   //++++++++
        //   sight: mocks.first,
        // ), // Детлизация места
        home: VisitingScreen(), // посетить / хочу посетить ++++
      );
}
