import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';
import 'package:places_yakimova_project/ui/screen/const/assets.dart';
import 'package:places_yakimova_project/ui/screen/const/value_text.dart';

import 'package:places_yakimova_project/ui/screen/const/values.dart';

class SightDetailsScreen extends StatefulWidget {
  const SightDetailsScreen({
    Key? key,
    required this.sight,
  }) : super(key: key);

  final Sight sight;

  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Image(image: widget.sight.urls.first),
              Padding(
                padding: const EdgeInsets.all(AppSizes.standartSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.sight.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: AppSizes.standartSizedBox),
                    _TypeCard(type: mapSightTypeToString[widget.sight.type]!),
                    const SizedBox(height: AppSizes.standartSpacingTextGalery),
                    Text(
                      widget.sight.details,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(height: AppSizes.standartSpacingTextGalery),
                    _ButtonRoute(),
                    const SizedBox(height: AppSizes.standartSpacingTextGalery),
                    _DividingLine(),
                    const SizedBox(height: AppSizes.standartHeightSmall),
                    _FooterButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Image.network(
            image,
            fit: BoxFit.cover,
            height: AppSizes.standartHightImage,
          ),
          Positioned(
            left: AppSizes.standartSpacing,
            top: MediaQuery.of(context).padding.top + AppSizes.standartSpacing,
            child: Container(
              width: AppSizes.standartSizeIndent,
              height: AppSizes.standartSizeIndent,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppSizes.standartRadius)),
                color: Theme.of(context).colorScheme.background,
              ),
              child: Center(
                child: FlatButton(
                  child: SvgPicture.asset(
                    AppAssets.backArrowSvg,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    print('Назад. Детализация места.');
                  },
                ),
              ),
            ),
          ),
        ],
      );
}

class _TypeCard extends StatelessWidget {
  const _TypeCard({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Text(
            type,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(width: AppSizes.standartSpacing),
          Text(
            AppTexts.textTimeWork,
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      );
}

class _ButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.standartSpacing),
              child: FlatButton(
                  child: Container(
                    height: AppSizes.standartHeightBigger,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Theme.of(context).buttonColor,
                    ),
                    child: Row(
                      children: [
                        StandartSizedBox.standartSizedBoxBigger,
                        SvgPicture.asset(AppAssets.routeSvg),
                        StandartSizedBox.standartSizedBoxBig,
                        Text(
                          AppTexts.textBuildRroute,
                          style: Theme.of(context).textTheme.button,
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    print('Построить маршрут. Детализация места.');
                  }),
            ),
          ),
          // ),
        ],
      );
}

class _DividingLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: AppSizes.standartHeight,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(AppSizes.standartRadiusBig)),
          color: Theme.of(context).dividerColor,
        ),
      );
}

class _FooterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: FlatButton(
                child: _ButtonPlan(),
                onPressed: () {
                  print('Запланировать. Детализация места.');
                }),
          ),
          Expanded(
            child: FlatButton(
                onPressed: () {
                  print('В избраное. Детализация места.');
                },
                child: _ButtonFavorites()),
          ),
        ],
      );
}

class _ButtonPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppSizes.standartHeightBig,
        width: AppSizes.standartWidthLargest,
        child: Row(
          children: [
            const SizedBox(width: AppSizes.standartSizeIndent),
            SvgPicture.asset(AppAssets.calendarSvg),
            StandartSizedBox.standartSizedBox,
            Text(
              AppTexts.textToSchedule,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      );
}

class _ButtonFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppSizes.standartHeightBig,
        width: AppSizes.standartWidthLargest,
        child: Positioned(
          left: AppSizes.standartSpacingBig,
          child: Row(
            children: [
              SvgPicture.asset(
                AppAssets.heartFullSvg,
              ),
              StandartSizedBox.standartSizedBox,
              Text(
                AppTexts.textToFavorites,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      );
}
