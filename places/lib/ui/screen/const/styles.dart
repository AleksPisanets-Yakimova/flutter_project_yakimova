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

// Content styles.

const textPageTitle = TextStyle(
  fontFamily: _defaultFontFamily,
  fontWeight: _bold,
  fontSize: 32,
  height: 32 / 36,
);

const textSightListCategory = TextStyle(
  fontFamily: _defaultFontFamily,
  fontWeight: _bold,
  fontSize: 14,
  height: 14 / 18,
);

const textSightListName = TextStyle(
  fontFamily: _defaultFontFamily,
  fontWeight: _bold,
  fontSize: 16,
  height: 20 / 16,
);

const textSightListTimeWork = TextStyle(
  fontFamily: _defaultFontFamily,
  fontWeight: _regular,
  fontSize: 14,
  height: 14 / 18,
);

const textSightVisFavorite = TextStyle(
  fontFamily: _defaultFontFamily,
  fontWeight: _regular,
  fontSize: 18,
  height: 18 / 24,
);

const textSightVisTab = TextStyle(
  fontFamily: _defaultFontFamily,
  fontWeight: _bold,
  fontSize: 14,
  height: 14 / 18,
);
