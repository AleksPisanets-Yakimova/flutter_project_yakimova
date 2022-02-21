import 'package:flutter/material.dart';
// import 'package:places_yakimova_project/domain/sight.dart';
// import 'package:places_yakimova_project/mocks.dart';
import 'package:places_yakimova_project/ui/screen/rez/dark_theme.dart';
import 'package:places_yakimova_project/ui/screen/rez/light_theme.dart';
import 'package:places_yakimova_project/ui/screen/rez/my_theme_data.dart';
// import 'package:places_yakimova_project/ui/screen/rez/themes.dart';
// import 'package:places_yakimova_project/ui/screen/sight_details_screen.dart';
import 'package:places_yakimova_project/ui/screen/sight_list_screen.dart';
// import 'package:places_yakimova_project/ui/screen/sight_visiting_screen.dart';
// import 'package:places_yakimova_project/ui/screen/sight_visiting_screen.dart';
// import 'package:places_yakimova_project/ui/screen/rez/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>()!;

  static MyThemeData themeOf(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>()!.myTheme;

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool _isDarkMode = true;
  late MyThemeData myTheme;

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
    myTheme = _isDarkMode ? createDarkTheme() : createLightTheme();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: myTheme.app,
        // ThemeData(
        //   primarySwatch: Colors.blue,
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        //   fontFamily: 'Roboto',
        // ),
        home: SightListScreen(), //Список интересных мест
        // home: SightDetailsScreen(
        //   sight: mocks.first,
        // ), // Детлизация места
        // home: VisitingScreen(), // посетить / хочу посетить
        // home: {},
      );
}
