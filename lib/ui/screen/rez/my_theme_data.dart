import 'package:flutter/material.dart';

/// Расширение добавляет [lighter] и [darker] к цвету.
extension ColorExt on Color {
  Color lighter(double level) =>
      Color.alphaBlend(this, Colors.white.withOpacity(level));

  Color darker(double level) =>
      Color.alphaBlend(this, Colors.black.withOpacity(level));
}

/// Собственная тема приложения, т.к. средств обычной ThemeData в нашем случае
/// недостаточно.
class MyThemeData {
  MyThemeData({
    required Brightness brightness,
    required this.background,
    required this.colorDecoration,
    required this.colorIndicator,
    required this.colorTextTitle,
    required this.colorTextSightCategory,
    required this.colorTextSightTimeWork,
    required this.colorSelectedItem,
    required this.colorUnselectedItem,
    required this.colorTabBarSelectedBack,
    required this.colorTabBarUnselectedBack,
    required this.colorTabBarSelectedText,
    required this.colorTabBarUnselectedText,
    required this.colorTextTimePlan,
  }) {
    app = ThemeData(brightness: brightness);
  }

  late final ThemeData app;
  final Color background;
  final Color colorDecoration;
  final Color colorIndicator;
  final Color colorTextTitle;
  final Color colorTextSightCategory;
  final Color colorTextSightTimeWork;
  final Color colorSelectedItem;
  final Color colorUnselectedItem;
  final Color colorTabBarSelectedBack;
  final Color colorTabBarUnselectedBack;
  final Color colorTabBarSelectedText;
  final Color colorTabBarUnselectedText;
  final Color colorTextTimePlan;
}
