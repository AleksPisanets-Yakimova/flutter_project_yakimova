import 'package:flutter/material.dart';
import 'package:places_yakimova_project/domain/sight.dart';
import 'package:places_yakimova_project/mocks/mocks.dart';
import 'package:places_yakimova_project/ui/screen/const/value_text.dart';
import 'package:places_yakimova_project/ui/screen/filter_screen.dart';
import 'package:places_yakimova_project/ui/screen/rez/themes.dart';
import 'package:places_yakimova_project/ui/screen/settings_screen.dart';

import 'package:places_yakimova_project/ui/screen/sight_details_screen.dart';
import 'package:places_yakimova_project/ui/screen/sight_list_screen.dart';
import 'package:places_yakimova_project/ui/screen/sight_visiting_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>()!;

  static ThemeData themeOf(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>()!.myTheme;

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool _isDarkMode = true;
  late ThemeData myTheme;

  @override
  void initState() {
    super.initState();

    _updateTheme();
  }

  void toogleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      _updateTheme();
    });
  }

  void _updateTheme() {
    myTheme = _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppTexts.title,
        theme: myTheme,

        // home: SightListScreen(), //Список интересных мест +++++++
        // home: SightDetailsScreen(
        //   //++++++++
        //   sight: mocks.first,
        // ), // Детлизация места
        // home: VisitingScreen(), // посетить / хочу посетить ++++
        // home: FilterScreen(),
        home: SettingsScreen(), // настройки
      );
}
