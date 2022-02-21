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
  }) {
    app = ThemeData(brightness: brightness);
  }

  late final ThemeData app;
  final Color background;
  final Color colorDecoration;
  final Color colorIndicator;
}
