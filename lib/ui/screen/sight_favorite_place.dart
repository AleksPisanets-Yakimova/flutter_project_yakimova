import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';

import 'package:places_yakimova_project/ui/screen/const/assets.dart';
import 'package:places_yakimova_project/ui/screen/const/value_text.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';

class SightCardFavoritePlace extends StatelessWidget {
  const SightCardFavoritePlace({
    Key? key,
    required this.sight,
    required this.visited,
  }) : super(key: key);

  final Sight sight;
  final bool visited;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSizes.standartSpacingZero,
        right: AppSizes.standartSpacingZero,
        top: AppSizes.standartSpacingTextGalery,
      ),
      child: _ContentCard(
        sight: sight,
        visited: visited,
      ),
    );
  }
}

class _ContentCard extends StatelessWidget {
  const _ContentCard({
    Key? key,
    required this.sight,
    required this.visited,
  }) : super(key: key);

  final Sight sight;
  final bool visited;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSizes.standartSpacing),
        ),
        color: Theme.of(context).cardColor,
      ),
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 6 / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _ImageAndItsParameters(
              sight: sight,
              visited: visited,
            ),
            _CardOptions(
              sightName: sight.name,
              visited: visited,
            )
          ],
        ),
      ),
    );
  }
}

class _ImageAndItsParameters extends StatelessWidget {
  const _ImageAndItsParameters({
    Key? key,
    required this.sight,
    required this.visited,
  }) : super(key: key);

  final Sight sight;
  final bool visited;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                sight.urls[0],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) =>
                    progress == null ? child : const LinearProgressIndicator(),
              ),
            ),
            FlatButton(
              onPressed: () {
                print('Тип карточки. Список интересных мест. Хочу посетить.');
              },
              child: Positioned(
                left: AppSizes.standartSpacing,
                top: AppSizes.standartSpacing,
                child: Text(
                  mapSightTypeToString[sight.type]!,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
            Positioned(
              right: 15,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (visited == true)
                    FlatButton(
                        onPressed: () {
                          print('Запланировать иконка. Хочу посетить.');
                        },
                        child: SvgPicture.asset(AppAssets.calendarWhiteSvg))
                  else
                    FlatButton(
                        onPressed: () {
                          print('Поделиться иконка. Хочу посетить.');
                        },
                        child: SvgPicture.asset(AppAssets.shareSvg)),
                  SvgPicture.asset(AppAssets.outputSvg),
                ],
              ),
            ),
          ],
        ),
      );
}

class _CardOptions extends StatelessWidget {
  const _CardOptions({
    Key? key,
    required this.sightName,
    required this.visited,
  }) : super(key: key);

  final String sightName;
  final bool visited;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.standartSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                sightName,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: AppSizes.standartSizedBox),
              if (visited)
                Expanded(
                  child: Text(
                    AppTexts.textTimePlan,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              const SizedBox(height: AppSizes.standartSizedBox),
              Expanded(
                child: Text(
                  AppTexts.textTimeWork,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
        ),
      );
}
