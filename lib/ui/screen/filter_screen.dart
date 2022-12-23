import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places_yakimova_project/domain/filter_categories.dart';
import 'package:places_yakimova_project/domain/sight.dart';
import 'package:places_yakimova_project/mocks/filter_categories_mocks.dart';
import 'package:places_yakimova_project/mocks/mocks.dart';
import 'package:places_yakimova_project/ui/screen/const/assets.dart';
import 'package:places_yakimova_project/ui/screen/const/colors.dart';
import 'package:places_yakimova_project/ui/screen/const/styles.dart';
import 'package:places_yakimova_project/ui/screen/const/value_text.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';

Set<SightType> _selectedCategories = {};
late double _startDistance = DistanceSettings.from;
late double _endDistance = DistanceSettings.to;
late double _distance = (_endDistance - _startDistance) / 1000;
late Set<int> _selectedPlaces = {};
late var _selectCount = _selectedPlaces.length;

class FilterScreen extends StatefulWidget {
  static _FilterScreenState of(
    BuildContext context, {
    bool listen = false,
  }) =>
      _FilterScreenInheritedWidget.of(context, listen: listen)!;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _needUpdate = false;

  // Обновление дерева зависимостей.
  void update() {
    setState(() {
      _needUpdate = true;
    });
  }

  void clearSearch() {
    _selectedCategories.clear();
    _selectedPlaces.clear();
    _selectCount = 0;
    print('В функции clearSearch: $_selectedCategories');
    update();
  }

  void updateSearch(SightType type) {
    if (_selectedCategories.contains(type)) {
      _selectedCategories.remove(type);
    } else {
      _selectedCategories.add(type);
    }
    _selectCount = _selectedCategories.length;
    update();
  }

  void updateSelect(int id) {
    _selectedPlaces.add(id);
    update();
  }

  @override
  Widget build(BuildContext context) => _FilterScreenInheritedWidget(
        state: this,
        child: Scaffold(
          appBar: AppBar(
            title: _BackAndClear(),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
            child: _Content(),
          ),
        ),
      );
}

class _FilterScreenInheritedWidget extends InheritedWidget {
  const _FilterScreenInheritedWidget({
    Key? key,
    required this.state,
    required Widget child,
  }) : super(key: key, child: child);

  final _FilterScreenState state;

  /// Ищет InheritedWidget в дереве, возвращает [state].
  ///
  /// Если надо, подписывается ([listen]).
  static _FilterScreenState? of(
    BuildContext context, {
    required bool listen,
  }) =>
      (listen
              ? context.dependOnInheritedWidgetOfExactType<
                  _FilterScreenInheritedWidget>()
              : context
                  .getElementForInheritedWidgetOfExactType<
                      _FilterScreenInheritedWidget>()
                  ?.widget as _FilterScreenInheritedWidget?)
          ?.state;

  @override
  bool updateShouldNotify(_FilterScreenInheritedWidget oldWidget) {
    if (state._needUpdate) {
      state._needUpdate = false;
      return true;
    }

    return false;
  }
}

class _Content extends StatefulWidget {
  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  @override
  Widget build(BuildContext context) {
    FilterScreen.of(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Categories(),
        const _FilterRow(firstline: true),
        StandartSizedBox.filterSizedBoxHeightMax,
        const _FilterRow(firstline: false),
        const SizedBox(height: 60),
        _Distance(),
        _ShowButton(),
      ],
    );
  }
}

class _FilterTextButton extends StatefulWidget {
  const _FilterTextButton({
    Key? key,
    required this.filterCategory,
  }) : super(key: key);

  final FilterCategories filterCategory;

  @override
  State<_FilterTextButton> createState() => _FilterTextButtonState();
}

class _FilterTextButtonState extends State<_FilterTextButton> {
  @override
  Widget build(BuildContext context) {
    FilterScreen.of(context, listen: true);
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        child: Material(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    FilterScreen.of(context, listen: false)
                        .updateSearch(widget.filterCategory.type);
                  });
                },
                child: Stack(
                  children: <Widget>[
                    SvgPicture.asset(widget.filterCategory.imageCategory,
                        color: Theme.of(context).buttonColor),
                    if (_selectedCategories
                        .contains(widget.filterCategory.type))
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: SvgPicture.asset(
                          AppAssets.tickChoice,
                        ),
                      ),
                  ],
                ),
              ),
              StandartSizedBox.filterSizedBoxHeight,
              Text(
                widget.filterCategory.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow({
    Key? key,
    required this.firstline,
  }) : super(key: key);

  final bool firstline;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Row(
          children: [
            _FilterTextButton(
              filterCategory:
                  firstline ? filterCategories[0] : filterCategories[1],
            ),
            StandartSizedBox.filterSizedBoxWidth,
            _FilterTextButton(
              filterCategory:
                  firstline ? filterCategories[2] : filterCategories[3],
            ),
            StandartSizedBox.filterSizedBoxWidth,
            _FilterTextButton(
              filterCategory:
                  firstline ? filterCategories[4] : filterCategories[5],
            ),
          ],
        ),
      );
}

class _BackAndClear extends StatefulWidget {
  @override
  State<_BackAndClear> createState() => _BackAndClearState();
}

class _BackAndClearState extends State<_BackAndClear> {
  @override
  Widget build(BuildContext context) => Center(
        child: Row(
          children: [
            TextButton(
              child: SvgPicture.asset(
                AppAssets.backArrowSvg,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                print('Назад. Фильтр.');
              },
            ),
            const Spacer(),
            TextButton(
              child: Text(
                AppTexts.textClear,
                style: AppTypography.textSightListName
                    .withColor(AppColors.colorMediumSeaGreen),
              ),
              onPressed: () {
                print('Очистить. Фильтр.');
                setState(() {
                  FilterScreen.of(context, listen: false).clearSearch();
                });
                print('В виджете _BackAndClearState: $_selectedCategories');
              },
            ),
          ],
        ),
      );
}

class _Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 24,
        ),
        child: Text(
          AppTexts.textCategories,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      );
}

class _Distance extends StatefulWidget {
  @override
  State<_Distance> createState() => _DistanceState();
}

class _DistanceState extends State<_Distance> {
  RangeValues _value =
      const RangeValues(DistanceSettings.from, DistanceSettings.to);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  AppTexts.textDistance,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text('от $_startDistance до $_endDistance м'),
                ),
              ],
            ),
            RangeSlider(
              values: _value,
              min: 100,
              max: 10000,
              divisions: 10,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              onChanged: (value) {
                print(value);
                setState(() {
                  _value = value;
                  _startDistance = value.start;
                  _endDistance = value.end;
                  _distance = (_endDistance - _startDistance) / 1000;
                });
              },
            ),
          ],
        ),
      );
}

class _ShowButton extends StatefulWidget {
  @override
  State<_ShowButton> createState() => _ShowButtonState();
}

class _ShowButtonState extends State<_ShowButton> {
  @override
  Widget build(BuildContext context) {
    FilterScreen.of(context, listen: true);
    return Expanded(
      child: TextButton(
          child: Container(
            height: AppSizes.standartHeightBigger,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                  Radius.circular(AppSizes.standartRadiusBig)),
              color: Theme.of(context).buttonColor,
            ),
            child: Center(
              child: Text(
                _selectCount > 0
                    ? '${AppTexts.textShow} ($_selectCount)'
                    : AppTexts.textShow,
                style: Theme.of(context).textTheme.button,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          onPressed: () {
            print('Кнопка показать. Фильтр');
            for (final places in mocks) {
              final nearMe = _placesAround(
                  places.lat,
                  places.lon,
                  DistanceSettings.latitude,
                  DistanceSettings.longitude,
                  _distance);

              if (nearMe && _selectedCategories.contains(places.type)) {
                FilterScreen.of(context).updateSelect(places.id);
              }
            }
            print(_selectedPlaces);
          }),
    );
  }
}

/// locationSettings:
/// 1/ latitudePlaces / Широта места.
/// 2/ longitudePlaces / Долгота места.
/// 3/ latitudeMyLocation / Широта моего местоположения.
/// 4/ longitudeMyLocation / Долгота моего местоположения.
/// 5/ distance / Расстояние.

bool _placesAround(
  double latitudePlaces,
  double longitudePlaces,
  double latitudeMyLocation,
  double longitudeMyLocation,
  double distance,
) {
  const ky = 40000 / 360;
  final kx = math.cos(math.pi * latitudeMyLocation / 180.0) * ky;
  final dx = ((longitudeMyLocation - longitudePlaces) * kx).abs();
  final dy = ((latitudeMyLocation - latitudePlaces) * ky).abs();

  return math.sqrt(dx * dx + dy * dy) <= distance;
}
