import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places_yakimova_project/domain/filter_categories.dart';
import 'package:places_yakimova_project/mocks/distance_mocks.dart';
import 'package:places_yakimova_project/mocks/filter_categories_mocks.dart';
import 'package:places_yakimova_project/ui/screen/const/assets.dart';
import 'package:places_yakimova_project/ui/screen/const/button.dart';
import 'package:places_yakimova_project/ui/screen/const/colors.dart';
import 'package:places_yakimova_project/ui/screen/const/styles.dart';
import 'package:places_yakimova_project/ui/screen/const/value_text.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';

class _Values {
  static Set<int> selectedCategories = {};
}

class FilterScreen extends StatefulWidget {
  @override
  FilterScreenState createState() => FilterScreenState();
}

class FilterScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _BackAndClear(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
        child: _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Categories(),
        _FilterRow(firstline: true),
        StandartSizedBox.filterSizedBoxHeightMax,
        _FilterRow(firstline: false),
        SizedBox(
          height: 60,
        ),
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
  late String _image;

  @override
  void initState() {
    super.initState();

    _image = AppAssets.notSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        child: Material(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  if (_Values.selectedCategories
                      .contains(widget.filterCategory.id))
                    _Values.selectedCategories.remove(widget.filterCategory.id);
                  else {
                    _Values.selectedCategories.add(widget.filterCategory.id);
                  }

                  setState(() {
                    if (_Values.selectedCategories
                        .contains(widget.filterCategory.id)) {
                      _image = AppAssets.tickChoice;
                    } else {
                      _image = AppAssets.notSelected;
                    }
                  });
                },
                child: Stack(
                  children: <Widget>[
                    SvgPicture.asset(widget.filterCategory.imageCategory,
                        color: Theme.of(context).buttonColor),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: SvgPicture.asset(
                        _image,
                      ),
                    ),
                  ],
                ),
              ),
              StandartSizedBox.filterSizedBoxHeight,
              Text(
                widget.filterCategory.name,
                textAlign: TextAlign.center,
                style: AppTypography.textFilter.withColor(AppColors.colorBlack),
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
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        _FilterTextButton(
          filterCategory: firstline ? filterCategories[0] : filterCategories[1],
        ),
        StandartSizedBox.filterSizedBoxWidth,
        _FilterTextButton(
          filterCategory: firstline ? filterCategories[2] : filterCategories[3],
        ),
        StandartSizedBox.filterSizedBoxWidth,
        _FilterTextButton(
          filterCategory: firstline ? filterCategories[4] : filterCategories[5],
        ),
      ],
    ));
  }
}

class _BackAndClear extends StatelessWidget {
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
            Spacer(),
            TextButton(
              child: Text(
                AppTexts.textClear,
                style: AppTypography.textSightListName
                    .withColor(AppColors.colorMediumSeaGreen),
              ),
              onPressed: () {
                print('Очистить. Фильтр.');
                _Values.selectedCategories = {};
                print(_Values.selectedCategories);
              },
            ),
          ],
        ),
      );
}

class _Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      child: Text(
        AppTexts.textCategories,
        style: AppTypography.textFilter.withColor(AppColors.colorDarkSlateGray),
      ),
    );
  }
}

class _Distance extends StatefulWidget {
  @override
  State<_Distance> createState() => _DistanceState();
}

class _DistanceState extends State<_Distance> {
  RangeValues _value =
      RangeValues(distanceSettings[0].from, distanceSettings[0].to);
  late double _startDistance = distanceSettings[0].from;
  late double _endDistance = distanceSettings[0].to;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
              Spacer(),
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
            divisions: 100,
            activeColor: Colors.green,
            inactiveColor: Colors.grey,
            onChanged: (RangeValues value) {
              print(value);
              setState(() {
                _value = value;
                _startDistance = value.start;
                _endDistance = value.end;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _ShowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MyButton(
        imageButton: '',
        textButton: AppTexts.textShow,
        textPrint: 'Кнопка показать. Фильтр',
      ),
    );
  }
}
