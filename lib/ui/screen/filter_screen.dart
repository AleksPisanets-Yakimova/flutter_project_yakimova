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

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: _BackAndClear(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
          child: _Content(),
        ),
      );
}

class _Content extends StatefulWidget {
  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Categories(),
          const _FilterRow(firstline: true),
          StandartSizedBox.filterSizedBoxHeightMax,
          const _FilterRow(firstline: false),
          const SizedBox(
            height: 60,
          ),
          _Distance(),
          _ShowButton(),
        ],
      );
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
  Widget build(BuildContext context) => Expanded(
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          child: Material(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (_selectedCategories
                          .contains(widget.filterCategory.type)) {
                        _selectedCategories.remove(widget.filterCategory.type);
                      } else {
                        _selectedCategories.add(widget.filterCategory.type);
                      }
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
                  style:
                      AppTypography.textFilter.withColor(AppColors.colorBlack),
                ),
              ],
            ),
          ),
        ),
      );
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
      ));
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
                  _selectedCategories = {};
                });
                print(_selectedCategories);
              },
            ),
          ],
        ),
      );
}

class _Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 24),
        child: Text(
          AppTexts.textCategories,
          style:
              AppTypography.textFilter.withColor(AppColors.colorDarkSlateGray),
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
                  style: AppTypography.textFilterDistance
                      .withColor(AppColors.colorBlack),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text('от ${_startDistance} до ${_endDistance} м'),
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

class _ShowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Expanded(
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
                  AppTexts.textShow,
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
                  _selectedPlaces.add(places.id);
                }
              }
              print(_selectedPlaces);
            }),
      );
}

/// locationSettings:
/// 1/ latitudePlaces / широта места
/// 2/ longitudePlaces / долгота места
/// 3/ latitudeMyLocation / широта моего местоположения
/// 4/ longitudeMyLocation / долгота моего местоположения
/// 5/ distance / расстояние

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
