import 'package:flutter/cupertino.dart';

/// Расширение добавляет [withColor] к стилю.

extension TextStyleExt on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle get withBold => copyWith(fontWeight: _bold);
  TextStyle get withLight => copyWith(fontWeight: _light);
}

const _defaultFontFamily = 'Roboto';
const _light = FontWeight.w300;
const _regular = FontWeight.normal;
const _bold = FontWeight.w700;

class AppTypography {
// Content styles.

  static const textPageTitle = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: _bold,
    fontSize: 32,
  );

  static const textSightListCategory = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: _bold,
    fontSize: 14,
  );

  static const textSightListName = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: _bold,
    fontSize: 16,
  );

  static const textSightListTimeWork = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: _regular,
    fontSize: 14,
  );

  static const textSightVisFavorite = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: _bold,
    fontSize: 18,
  );

  static const textSightVisTab = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: _bold,
    fontSize: 14,
  );

  static const textSightCardCaption = TextStyle(
    fontFamily: _defaultFontFamily,
    fontWeight: _bold,
    fontSize: 24,
  );
}
